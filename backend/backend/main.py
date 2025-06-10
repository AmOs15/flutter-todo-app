import os
import uuid
from datetime import datetime
from flask import Flask, request, jsonify
from pydantic import BaseModel, ValidationError
from typing import Any, Dict
from google.cloud import firestore


class ToDoListItem(BaseModel):
    task_id: str
    title: str
    description: str
    created_at: datetime
    updated_at: datetime
    due_date: datetime
    completed: bool
    is_trash: bool

def create_app(project_id: str = None) -> Flask:
    app = Flask(__name__)

    # プロジェクトID取得・チェック
    proj = project_id or os.getenv("MY_PROJECT_ID")
    if not proj:
        raise RuntimeError("Environment variable MY_PROJECT_ID must be set")
    
    # Firestore クライアントをアプリコンテキストに保持
    app.db = firestore.Client(project=proj)
    
    return app

app = create_app()

@app.route("/todo/tasks", methods=["GET"])
def get_tasks() -> Any:
    tasks = app.db.collection('todo').stream()
    items = [task.to_dict() for task in tasks]
    return jsonify(data=items), 200

@app.route("/todo/tasks", methods=["POST"])
def add_task() -> Any:
    payload = request.get_json(force=True)
    try:
        item = ToDoListItem(**payload, task_id=str(uuid.uuid4()),
                            created_at=datetime.utcnow(),
                            updated_at=datetime.utcnow())
    except ValidationError as e:
        return jsonify(error=e.errors()), 400

    app.db.collection("todo").document(item.task_id).set(item.dict())
    return jsonify(data=item.dict()), 200

@app.route("/todo/delete", methods=["POST"])
def delete_task() -> Any:
    data = request.get_json(force=True)
    task_id = data.get("task_id")
    todo_ref = app.db.collection("todo").document(task_id)
    todo_ref.update({"is_trash": True})
    return jsonify(deleted=task_id), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)

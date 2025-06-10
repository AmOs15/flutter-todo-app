import requests
from datetime import datetime

# ローカルまたは実稼働サーバーのベース URL を指定
BASE_URL = "http://localhost:8080"


def get_tasks():
    response = requests.get(f"{BASE_URL}/todo/tasks")
    response.raise_for_status()
    return response.json().get("data", [])

def add_task(title: str, description: str, due_date: str,
             completed: bool = False, is_trash: bool = False):
    payload = {
        "title": title,
        "description": description,
        "due_date": due_date,
        "completed": completed,
        "is_trash": is_trash,
    }
    response = requests.post(
        f"{BASE_URL}/todo/tasks",
        json=payload
    )
    response.raise_for_status()
    return response.json()

def delete_task(task_id: str):
    response = requests.get(f"{BASE_URL}/todo/tasks")
    before = response.json().get("data", [])

    payload = {"task_id": task_id}
    response = requests.post(
        f"{BASE_URL}/todo/delete",
        json=payload
    )
    response.raise_for_status()

    response = requests.get(f"{BASE_URL}/todo/tasks")
    after = response.json().get("data", [])

    print(f"before: {before}")
    print(f"after: {after}")

    return response.json().get("deleted")

def main():
    # タスク一覧表示
    print()
    tasks = get_tasks()
    print("Current tasks:", tasks)

    # 新規タスク追加
    print()
    new = add_task(
        title="買い物", 
        description="牛乳とパンを買う", 
        due_date="2025-06-15T12:00:00Z"
    )
    print("Added task:", new)

    # タスク削除
    print()
    target_id = new.get("data").get("task_id")
    deleted_id = delete_task(target_id)  # サンプルでは title を ID 代わりに
    print(f"Deleted: {deleted_id}")

# ----- 使用例 -----
if __name__ == "__main__":
    main()

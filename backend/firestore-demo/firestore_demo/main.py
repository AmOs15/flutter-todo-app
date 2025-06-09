import os
from flask import Flask
from google.cloud import firestore

# 環境変数にプロジェクトIDを指定
MY_PROJECT_ID = os.getenv("MY_PROJECT_ID")
db = firestore.Client(project=MY_PROJECT_ID)

app = Flask(__name__)

@app.route('/cities', methods=['GET'])
def get_items():
    docs = db.collection('cities').stream()
    items = [doc.to_dict() for doc in docs]
    return items, 200

@app.route('/cities', methods=['POST'])
def add_items():
    data = {"name": "New York", "state": "NY", "country": "USA"}
    db.collection("cities").document().set(data)
    return "Done!", 200


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))

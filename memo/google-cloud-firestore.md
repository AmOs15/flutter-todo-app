# Google Cloude Firestore に入門してみた
## とは
リアルタイム通知機能を備えた NoSQL サーバーレス データベース<br>
NoSQLなのか...<br>
コレクション(集合) -> ドキュメント(レコード)<br>
各ドキュメントJSON形式のフィールド<br>
フロントエンドからサーバーサイドを経由せずに実装が可能らしい

## やってみよう
Google CloudのコンソールからFirestoreのページに飛ぶ -> `Firestoreデータベースを作成`<br>
プロジェクトIDでDBにアクセスする場合DB名を(default)にする必要性？<br>
Google Cloud Functions のコードをなんとなく作成(クイックスタートPython参考)
```
gcloud run deploy firestore-demo \
  --source . \
  --set-env-vars MY_PROJECT_ID="<My ID>"
```
環境変数を指定してデプロイ<br>
### 無事に動いた？

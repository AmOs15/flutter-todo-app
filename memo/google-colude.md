# Google Cloude Function に入門してみた
## とは
AWSのLambdaのGoogle版の認識<br>
フルマネージドなサーバーレスコンピューティングサービス
## やってみよう
- Google Cloude にアクセス
- 新しいプロジェクト `flutter-todo-app`
- お支払い設定をする
- Google Cloud Function
...とても難しい<br>
### クイックスタートをしてみる
`https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-python-service?hl=ja`<br>
- gcloud CLI をインストールする
(入っているか `gcloud version` で確認)
- `gcloud init`で初期化 -> Sign inが求められる（CLI）
- projectの選択
- Cloud Run Admin API と Cloud Build API を有効に
- IAMの設定？(コマンド)
- コードを用意して　`rand/main.py`
- 依存関係を明記して　`rand/requirements.txt`
- `gcloud run deploy --source .` でデプロイ

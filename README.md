教材を参考に作成したシンプルなブログサービスです。以下の機能を備えています。

機能一覧
記事一覧表示機能
記事詳細表示機能
記事投稿機能（画像アップロード対応）
管理ユーザ登録機能
管理ユーザログイン機能
単体テスト機能（RSpec）
統合テスト機能（RSpec）
デモ

動作環境
OS: Windows
Ruby: 3.3.5-1
Rails: 7.2.1
データベース: SQLite3
セットアップ手順
1. リポジトリのクローン
git clone https://github.com/shinnosukeee/blog.git
cd blog
2. 必要なGemのインストール
bundle install
3. データベースの設定
rails db:create
rails db:migrate
4. テストデータの作成（任意）
rails db:seed
5. サーバーの起動
rails server
ブラウザでhttp://localhost:3000にアクセスします。

管理ユーザの作成
ブラウザでhttp://localhost:3000/admin_users/sign_upにアクセス。
必要な情報を入力して管理ユーザを登録します。

テストの実行
単体テスト・統合テスト
bundle exec rspec


使用技術
フレームワーク: Ruby on Rails
データベース: SQLite3
認証機能: Devise
画像アップロード: Active Storage
ページネーション: Kaminari
テストフレームワーク: RSpec

# TravelManager
![Screen Shot 2020-09-12 at 18 00 34](https://user-images.githubusercontent.com/65382860/92991969-1f3ce880-f522-11ea-8f0e-25da45b8f2e8.png)

## サイト概要
旅行写真を旅行ごとにアルバムとして整理・保存・公開できる、クラウドストレージ×SNSのサイトです。

### 制作動機
①旅行好きなので、旅行ごとに旅行写真を管理できるサイトがあったらいいなと思ったこと。
②写真の閲覧を中心に、旅行好きが集まりコミュニケーションを楽しめるようしたい。

### 主な利用シーン
①旅行後、大量に撮影した写真を整理する時に。<br>
②共有されている写真を閲覧したり、旅行好き同士で交流する際に。


## 機能一覧
・認証（devise, FACEBOOK-OAuth, Google-OAuth, 簡単ログイン）
・論理削除（paranoia不使用）
・アルバムモデルのCRUD + 渡航先ごとのソート + ランキングの実装）
・refile
・Ajaxを用いた非同期通信（アルバムへのいいね ・コメント、フォロー、DM）
・通知
・検索（ransack不使用）
・管理者への問い合わせ
・スライドショー（slick）
・ページネーション（kaminari）
・Bootstrap 3.3.6
・HTTPS（AMC）


## 環境

### 使用言語
Ruby 2.5.7<br>
Rails 5.2.4.3<br>
JavaScript
jQuery

### 開発環境
Vagrant<br>
VirtualBox

### インフラ
AWS(VPC, ALB, EC2, RDS, S3, CloudWatch, Route53)<br>
MySQL2<br>
Nginx<br>
Puma<br>
Capistrano

![Screen Shot 2020-09-12 at 17 50 27](https://user-images.githubusercontent.com/65382860/92991808-2b747600-f521-11ea-88a4-c03ca00a0898.png)



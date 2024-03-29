# TravelManager

こちらは私が未経験からエンジニア転職を目指す際に作成したポートフォリオです。

制作期間：2020年7月〜9月

サイトURL：https://travelmanager.work/

※現在は非公開

![Screen Shot 2020-10-02 at 15 48 18](https://user-images.githubusercontent.com/65382860/94895726-ed86c400-04c6-11eb-9dfb-c52f932a235d.png)

## サイト概要
旅行写真を旅行ごとにアルバムとして整理・保存・公開できる、クラウドストレージ×SNSのサイトです。

### 制作動機
①旅行好きなので、旅行ごとに旅行写真を管理できるサイトがあったらいいなと思ったこと。<br>
②写真の閲覧を中心に、旅行好きが集まりコミュニケーションを楽しめるようしたい。

### 主な利用シーン
①旅行後、大量に撮影した写真を整理する時に。<br>
②共有されている写真を閲覧したり、旅行好き同士で交流する際に。


## 機能一覧
・認証（devise, FACEBOOK-OAuth, Google-OAuth, 簡単ログイン）<br>
・論理削除（paranoia不使用）<br>
・アルバムモデルのCRUD + 渡航先ごとのソート + ランキングの実装）<br>
・refile<br>
・非同期通信（アルバムへのいいね ・コメント、フォロー、DM）<br>
・通知機能<br>
・検索（ransack不使用）<br>
・管理者への問い合わせ<br>
・ページネーション（kaminari）<br>
・HTTPS（AMC）

### 使用言語
Ruby 2.5.7<br>
Rails 5.2.4.3<br>
JavaScript<br>
jQuery

### インフラ
Docker/Docker Compose（開発環境のみ）<br>
AWS(VPC, ALB, EC2, RDS, S3, CloudWatch, Route53, AMC)<br>
MySQL2<br>
Nginx<br>
Puma<br>
Capistrano

![Screen Shot 2020-09-12 at 17 50 27](https://user-images.githubusercontent.com/65382860/92991808-2b747600-f521-11ea-88a4-c03ca00a0898.png)

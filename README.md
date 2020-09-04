# TravelManager

## サイト概要
・旅行の写真をアルバムごとに管理できます。<br>
・写真やアルバムは公開範囲を設定でき、自分のみの閲覧もしくは全体に公開と選択可能です。<br>
・いいね、コメント、DM、フォロー機能を実装しており、SNSとして交流可能です。<br>
・公開アルバムは、いいね数でのランキング化、フォローユーザーのアルバム一覧や渡航先ごとにソート可能です。

### サイトテーマ
旅行写真をアルバムごとにオンライン上に整理しておけるアプリです。<br>
同時に他のユーザーの旅行アルバムを閲覧したり、SNS機能で繋がることで旅行の情報交換や今後の旅行計画に活かすことができます。

### テーマを選んだ理由
旅行好きなので、旅行ごとに旅行写真を管理できるアプリがあったらいいなと思っていました。<br>
ただの写真保存アプリだとGoogle Photo等への保存で済むので、旅好き同士が集まりコミュニケーションも取れるアプリを目指しました。

### ターゲットユーザ
旅行好き向け、特に若者向けですが、家族みんなで始めればお互いの旅行記も見れるので、老若男女問わず参加可能です。

### 主な利用シーン
旅行後、フォルダに大量に追加された写真を整理する時に、<br>
また友人や著名人の共有された旅行写真を見れるように。


## 使用言語
Ruby 2.5.7
Rails 5.2.3
jQuery

## 開発環境
Vagrant
VirtualBox

## インフラ
AWS(VPC, ALB, EC2, RDS, S3, CloudWatch, Route53)
MySQL2
Nginx
Capistrano

## 設計書
AWS構成図：https://www.draw.io/?splash=0&libs=aws4#G1EK2HYssWr96MdARn5d01Da0E7TFrxDxD<br>
AWSインフラ設計書：https://docs.google.com/spreadsheets/d/16aOvEmaeERY9sJnISVEoCzHMdm-hsqsiSzcdHJ444xg/edit#gid=1423061029
画面遷移図：https://app.diagrams.net/#G1ucycmcjv-dJP1anNiGrAwhetKq85COSF<br>
ワイヤーフレーム：https://app.diagrams.net/#G15WaQEKPVDb8IvmGbWJQpM_QE8XPWlFxo<br>
ER図：https://app.diagrams.net/#G1XaZGDLRCwlSVLWSh2X-ScBNoz0WOfI5j<br>
テーブル定義書：https://docs.google.com/spreadsheets/d/1uycwkDtNoIt60pRpsL5flr0WV86l2HaCvgWiK9-dgrg/edit#gid=1619846018<br>
アプリケーション詳細設計：https://docs.google.com/spreadsheets/d/1iiipcScvt2HLLLZwqyZdQtNNcpqmSsUeLSFYtK7hHpY/edit#gid=1750380126<br>

### 機能一覧
https://docs.google.com/spreadsheets/d/1tByCzv0Q-mqNUkif13cRmxi3PpKx3aIsgxVRjtGxKeg/edit?usp=sharing



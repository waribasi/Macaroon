# アプリケーション名
マカロン

# アプリケーション概要
1日に摂取したカロリーを食べ物とそのカロリーを登録し、カレンダーで管理する。そして美味しかった食べ物を共有するアプリです。

# URL
https://macaroon-673.herokuapp.com/

# テストアカウント

# 利用方法
・各種機能はログインをしてから利用する。ログイン後はマイページに遷移し、保存ボタンからカロリーを保存できる。・詳細から編集、削除が可能。
・カレンダーには保存した日付にカロリーが反映される。
みんなのマカロンではみんなが登録したデータが一覧で表示され、各データの詳細からコメントができる。

# 目指した課題解決

# 洗い出した要件

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計

## usersテーブル
| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------  |
| nickname  | string | null: false                      |
| email | string | null: false, unique: true            |
| encrypted_password | string | null: false             |
| gender_id| integer | null: false                      |
| body_weight | integer | null: false                   |
| stature | integer | null: false                       |

### Association
-has_many : calories
-has_many : messages

## caloriesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | -------------------------------|
| calorie   | integer     | null: false                |
| food    |  string      | null: false                 |
| memo   | string  |                                   |
| start_time | datetime  | null: false                 |

### Association
-belongs_to : user
-has_many : messages

## messagesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | -------------------------------|
| message | string | null: false                       |

### Association
-belongs_to : user
-belongs_to : calorie

# ローカルでの動作方法
# アプリケーション名
マカロン

# アプリケーション概要
1日に摂取したカロリーを食べ物とそのカロリーを登録し、カレンダーで管理する。そして美味しかった食べ物を共有するアプリです。

# URL
https://macaroon-673.herokuapp.com/

# テストアカウント
・
# 利用方法
・各種機能はログインをしてから利用する。ログイン後はマイページに遷移し、保存ボタンからカロリーを保存できる。・詳細から編集、削除が可能。
・カレンダーには保存した日付にカロリーが反映される。
みんなのマカロンではみんなが登録したデータが一覧で表示され、各データの詳細からコメントができる。

# 制作背景(意図)
自分自身食事量が少なく、ちゃんと食べられているかどうか感覚でしか分からず、数値化にして食事に気を使いたいと思ったから。

# 実装した機能についての画像やGIFおよびその説明

### 新規登録方法
 ページ上部の「新規登録」から
 ニックネーム、Eメール、パスワード、性別、体重、身長を入力してください。
[![Image from Gyazo](https://i.gyazo.com/5162ee7dc2ea7b7be951ff5f10bed8ea.gif)](https://gyazo.com/5162ee7dc2ea7b7be951ff5f10bed8ea)

### マカロン（カロリー）の保存方法
マイページの「保存」から
食べ物、摂取したカロリー、
[![Image from Gyazo](https://i.gyazo.com/56395cfeee3451df3fadc4ae4544fba1.gif)](https://gyazo.com/56395cfeee3451df3fadc4ae4544fba1)


### コメントの方法
詳細ページよりコメントができます。

[![Image from Gyazo](https://i.gyazo.com/1a58f2e6a623189b7dfa18d0b096ba45.gif)](https://gyazo.com/1a58f2e6a623189b7dfa18d0b096ba45)

# 課題や今後実装したい機能
・日にち別にカロリーを合計してカレンダーからその日のカロリーをクリックするとその日のカロリー一覧が出るようにしたい。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/f4f2632f444b3b66f129b9fe1cca0e0b.png)](https://gyazo.com/f4f2632f444b3b66f129b9fe1cca0e0b)


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

# テーブル設計

- ActiveStorage 導入予定、導入後 items テーブルと紐付け

## users テーブル

| Column             | Type   | Options     | details        |
| ------------------ | ------ | ----------- | -------------- |
| name               | string | null: false | ニックネーム   |
| email              | string | null: false | メールアドレス |
| encrypted_password | string | null: false | パスワード     |
| first_name         | string | null: false | 名字           |
| first_name_kana    | string | null: false | 名字のフリガナ |
| last_name          | string | null: false | 名前           |
| last_name_kana     | string | null: false | 名前のフリガナ |
| birth_date         | date   | null: false | 生年月日       |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        | details        |
| ---------------------- | ---------- | ------------------------------ | -------------- |
| user                   | references | null: false, foreign_key: true | 出品者         |
| name                   | string     | null: false                    | 商品名         |
| info                   | text       | null: false                    | 商品の説明     |
| price                  | integer    | null: false                    | 価格           |
| category_id            | integer    | null: false                    | カテゴリー     |
| sales_atatus_id        | integer    | null: false                    | 商品の状態     |
| shipping_fee_status_id | integer    | null: false                    | 配送料の負担   |
| prefecture_id          | integer    | null: false                    | 発送元の地域   |
| scheduled_delivery_id  | integer    | null: false                    | 発送までの日数 |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        | details  |
| ------ | ---------- | ------------------------------ | -------- |
| user   | references | null: false, foreign_key: true | 購入者   |
| item   | references | null: false, foreign_key: true | 購入商品 |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        | details  |
| ------------- | ---------- | ------------------------------ | -------- |
| order         | references | null: false, foreign_key: true | 購入記録 |
| postal_code   | string     | null: false                    | 郵便番号 |
| prefecture_id | integer    | null: false                    | 都道府県 |
| city          | string     | null: false                    | 市区町村 |
| addresses     | string     | null: false                    | 番地     |
| building      | string     |                                | 建物名   |
| phone_number  | string     | null: false                    | 電話番号 |

### Association

- belongs_to :order

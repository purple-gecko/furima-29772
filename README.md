# テーブル設計

- ActiveStorage 導入予定、導入後 items テーブルと紐付け

## users テーブル

| Column          | Type   | Options     | details        |
| --------------- | ------ | ----------- | -------------- |
| name            | string | null: false | ニックネーム   |
| email           | string | null: false | メールアドレス |
| password        | string | null: false | パスワード     |
| first_name      | string | null: false | 名字           |
| first_name_kana | string | null: false | 名字のフリガナ |
| last_name       | string | null: false | 名前           |
| last_name_kana  | string | null: false | 名前のフリガナ |
| birth_date      | date   | null: false | 生年月日       |

### Association

-

## items テーブル

| Column                 | Type       | Options                        | details        |
| ---------------------- | ---------- | ------------------------------ | -------------- |
| user_id                | references | null: false, foreign_key: true | 出品者         |
| name                   | string     | null: false                    | 商品名         |
| info                   | text       | null: false                    | 商品の説明     |
| price                  | integer    | null: false                    | 価格           |
| category_id            | integer    | null: false                    | カテゴリー     |
| sales_atatus_id        | integer    | null: false                    | 商品の状態     |
| shipping_fee_status_id | integer    | null: false                    | 配送料の負担   |
| prefecture_id          | integer    | null: false                    | 発送元の地域   |
| scheduled_delivery_id  | integer    | null: false                    | 発送までの日数 |

### Association

-

## orders テーブル

| Column  | Type       | Options                        | details  |
| ------- | ---------- | ------------------------------ | -------- |
| user_id | references | null: false, foreign_key: true | 購入者   |
| item_id | references | null: false, foreign_key: true | 購入商品 |

### Association

-

## address テーブル

| Column        | Type       | Options                        | details  |
| ------------- | ---------- | ------------------------------ | -------- |
| order_id      | references | null: false, foreign_key: true | 購入記録 |
| postal_code   | string     | null: false                    | 郵便番号 |
| prefecture_id | integer    | null: false                    | 都道府県 |
| city          | string     | null: false                    | 市区町村 |
| addresses     | string     | null: false                    | 番地     |
| building      | string     |                                | 建物名   |
| phone_number  | integer    | null: false                    | 電話番号 |

### Association

-

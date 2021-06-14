# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :orders
- has_many :items


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | foreign_key: true              |
| title                  | string     | null: false                    |
| comment                | text       | null: false                    |
| category_id            | integer    | null: false                    |
| quantity_id            | integer    | null: false                    |
| delivery_payment_id    | integer    | null: false                    |
| delivery_prefecture_id | integer    | null: false                    | 
| delivery_time_id       | integer    | null: false                    |
| delivery_amount        | integer    | null: false                    |

### Association

- has_one    :order
- belongs_to :user


## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one    :shipping_info
- belongs_to :user

## shipping_infos テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    | 
| building      | integer    |                                |
| phone_number  | string     | null: false                    |

### Association

- has_one    :order
# README
# テーブル設計

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| name             | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| first_name       | string | null: false               |
| first_name(kana) | string | null: false               |
| last_name        | string | null: false               |
| last_name(kana)  | string | null: false               |
| birthday         | string | null: false               |

### Association

- has_many :orders
- has_many :items


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| title                  | string     | null: false                    |
| comment                | text       | null: false                    |
| category_id            | integer    | null: false                    |
| quantity_id            | integer    | null: false                    |
| delivery_payments_id   | integer    | null: false                    |
| delivery_prefecture_id | integer    | null: false                    | 
| delivery_times_id      | integer    | null: false                    |
| delivery_amount        | integer    | null: false                    |

### Association

- has_one    :order
- has_many   :shipping_info
- belongs_to :user


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| shipping_info_id | references | null: false, foreign_key: true |

### Association

- has_one    :item
- has_one    :shipping_info
- belongs_to :users

## shipping_infos テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| postal_code  | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    | 
| buildings    | integer    |                                |
| phone_number | integer    | null: false                    |

### Association

- has_one    :order
- belongs_to :items
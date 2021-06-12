# README
# テーブル設計

## users テーブル

| Column                      | Type   | Options     |
| --------------------------- | ------ | ----------- |
| name                        | string | null: false |
| email                       | string | null: false |
| password                    | string | null: false |
| password_confirmation       | string | null: false |
| first_name, Last_name       | text   | null: false |
| first_name, Last_name(kana) | text   | null: false |
| birthday                    | string | null: false |

### Association

- has_many :comments
- has_many :items

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | references |                                |
| title               | text       | null: false                    |
| text                | text       | null: false                    |
| Genre               |            | null: false                    |
| quantity            |            | null: false                    |
| delivery_payments   | string     | null: false                    |
| delivery_prefecture |            | null: false                    |
| delivery_times      |            | null: false                    |
| delivery_amount     |            | null: false                    |

### Association

- has_many   :comments
- belongs_to :user

## categorys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    |            | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association

- has_many   :item
- belongs_to :item_categorys

## item_categorys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| category_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :categorys

## brands テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    |            | null: false                    |

### Association

- has_many   :item_brands
- has_many   :item

## item_brands テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| brand_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :categorys
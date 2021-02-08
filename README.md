テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | --------| ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kata     | string  | null: false               |
| first_name_kata    | string  | null: false               |
| birth              | date    | null: false               |


### Association

- has_many :items
- has_many :purchases


## itemsテーブル
| Column                 | Type       | Options                        |
| ---------------------- | -----------| ------------------------------ |
| product                | string     | null: false                    |
| user                   | reference  | null: false, foreign_key: true |
| category_id            | integer    | null: false                    |
| product_description    | text       | null: false                    |
| product_states_id      | integer    | null: false                    |
| shipping_charges_id    | integer    | null: false                    |
| region_id              | integer    | null: false                    |
| eta_id                 | integer    | null: false                    |
| price                  | integer    | null: false                    |

### Association

- has_one :purchase
- belongs_to :user


## purchases テーブル

| Column  | Type     | Options                       |
| --------| -------- | ----------------------------- |
| user    | reference| null:false, foreign_key: true |
| item    | reference| null:false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                       |
| -----------------| ---------- | ----------------------------- |
| zio              | string     | null: false                   |
| ship_region_id   | integer    | null: false                   |
| ship_city        | string     | null: false                   |
| ship_address     | string     | null: false                   |
| ship_building    | string     |                               |
| phone            | integer    | null: false                   |
| purchase         | reference  | null:false, foreign_key: true |

- belongs_to :purchase
テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | --------| ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name(kata) | string  | null: false |
| last_name(kata) | string  | null: false |
| bod(y)          | string  | null: false |
| bod(m)          | string  | null: false |
| bod(d)          | string  | null: false |

### Association

- has_many :items
- has_many :purchase
- has_many :addresses

## itemsテーブル
| Column              | Type      | Options                       |
| ------------------- | ------ ---| ----------------------------- |
| product             | string    | null: false                   |
| user_id             | reference | null:false, foreign_key: true |
| class               | string    | null: false                   |
| product_description | text      | null: false                   |
| product_states      | text      | null: false                   |
| shipping_charges    | string    | null: false                   |
| region              | string    | null: false                   |
| eta                 | string    | null: false                   |
| price               | integer   | null: false                   |

### Association

- has_one :purchase
- belongs_to :users
- 

## purchases テーブル

| Column  | Type     | Options                       |
| --------| -------- | ----------------------------- |
| user_id | reference| null:false, foreign_key: true |
| item_id|| reference| null:false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type    | Options     |
| --------      | ------  | ----------- |
| zio           | string  | null: false |
| ship_region   | string  | null: false |
| ship_city     | string  | null: false |
| ship_address  | string  | null: false |
| ship_building | string  |             |
| phone         | integer | null: false |

- belongs_to :purchase
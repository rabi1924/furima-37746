# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique|
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          |  date  | null: false |

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name          | string | null: false |
| description   | string | null: false |
| category      | string | null: false |
| status        | string | null: false |
| shipping_cost | string | null: false |
| shipping_days | string | null: false |
| prefecture    | string | null: false |
| price         | string | null: false |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| item_id  | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination


## destinations テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| post_code     | string | null: false                    |
| prefecture    | string | null: false                    |
| city          | string | null: false                    |
| address       | string | null: false                    |
| building_name | string | null: false                    |
| phone_number  | string | null: false                    |
| buyer_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
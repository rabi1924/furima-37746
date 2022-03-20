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
| name             | string  | null: false |
| description      |  text   | null: false |
| category_id      | integer | null: false |
| status_id        | integer | null: false |
| shipping_cost_id | integer | null: false |
| shipping_day_id  | integer | null: false |
| prefecture_id    | integer | null: false |
| price            | integer | null: false |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination


## destinations テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
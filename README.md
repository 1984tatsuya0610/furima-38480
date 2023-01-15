# テーブル設計

## usersテーブル

| Column             | Type       | Options      |
| -------------------| -----------| -------------|
| nickname           | string     | null: false  |
| email              | string     | null: false  |
| encrypted_password | string     | null: false  |
| first_name         | string     | null: false  |
| family_name        | string     | null: false  |
| first_name_kana    | string     | null: false  |
| family_name_kana   | string     | null: false  |
| date_of_birth      | string     | null: false  |

### Association

- has_many :items
- has_many :orders
- has_one  :addresses

## itemsテーブル

| Column             | Type       | Options                         |
| -------------------| -----------| --------------------------------|
| name               | string     | null: false                     |
| introduction       | text       | null: false                     |
| price              | integer    | null: false                     |
| item_condition     | string     | null: false                     |
| preparation_day    | string     | null: false                     |
| postage_type       | string     | null: false                     |
| category           | string     | null: false                     |
| sender             | string     | null: false                     |
| seller             | references | null: false, foreign_key: true  |

### Association

- belong_to :users
- has_one   :orders
- has_one   :addresses

## orders

| Column             | Type       | Options                         |
| -------------------| -----------| --------------------------------|
| buyer              | references | null: false, foreign_key: true  |
| purchase           | references | null: false, foreign_key: true  |

### Association

- belong_to :users
- has_one   :items
- has_one   :addresses

## addresses

| Column             | Type       | Options      |
| -------------------| -----------| -------------|
| postal_code        | integer    | null: false  |
| prefectures        | string     | null: false  |
| municipality       | string     | null: false  |
| house_number       | integer    | null: false  |
| building_name      | siring     |              |
| phone_number       | integer    | null: false  |

### Association

- has_one :users
- has_one :items
- has_one :orders

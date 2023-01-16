# テーブル設計

## usersテーブル

| Column             | Type       | Options                  |
| -------------------| -----------| -------------------------|
| nickname           | string     | null: false              |
| email              | string     | null: false, unique:true |
| encrypted_password | string     | null: false              |
| first_name         | string     | null: false              |
| family_name        | string     | null: false              |
| first_name_kana    | string     | null: false              |
| family_name_kana   | string     | null: false              |
| date_of_birth      | date       | null: false              |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                         |
| -------------------| -----------| --------------------------------|
| name               | string     | null: false                     |
| introduction       | text       | null: false                     |
| price              | integer    | null: false                     |
| item_condition_id  | integer    | null: false                     |
| preparation_day_id | integer    | null: false                     |
| postage_type_id    | integer    | null: false                     |
| category_id        | integer    | null: false                     |
| sender_id          | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
| order              | references | null: false, foreign_key: true  |

### Association

- belong_to :user
- has_one   :order

## orders

| Column             | Type       | Options                         |
| -------------------| -----------| --------------------------------|
| user               | references | null: false, foreign_key: true  |
| item               | references | null: false, foreign_key: true  |

### Association

- belong_to :user
- belong_to :item
- has_one   :address

## addresses

| Column             | Type       | Options      |
| -------------------| -----------| -------------|
| postal_code        | string     | null: false  |
| prefecture_id      | string     | null: false  |
| municipality       | string     | null: false  |
| house_number       | string     | null: false  |
| building_name      | siring     |              |
| phone_number       | string     | null: false  |

### Association

- belong_to :order

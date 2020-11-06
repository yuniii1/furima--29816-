## usersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| date_select     | date       | null: false                    |
| nickname        | string     | null: false                    |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| shipping_id        | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| price              | integer    | null: false,                   |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :address
- belongs_to :user

## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| tell_phone      | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

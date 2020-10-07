## usersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| mail            | string     | null: false                    |
| password        | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| year            | string     | null: false                    |
| month           | string     | null: false                    |
| day             | string     | null: false                    |
| nickname        | string     | null: false                    |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition       | integer    | null: false                    |
| delivery_date   | references | null: false  foreign_key: true |
| shipping        | references | null: false  foreign_key: true |
| shipment_source | references | null: false  foreign_key: true |
| user            | references | null: false, foreign_key: true |
| price           | references | null: false, foreign_key: true |

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
| prefectures     | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| tell_phone      | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
## usersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| mail            | string     | null: false                    |
| password        | string     | null: false                    |
| first-name      | string     | null: false                    |
| last-name       | string     | null: false                    |
| first-name-kana | string     | null: false                    |
| last-name-kana  | string     | null: false                    |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| item            | string     | null: false                    |
| description     | string     | null: false                    |
| category_id     | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery-date   | string     | null: false                    |
| shipping        | string     | null: false                    |
| shipment-source | string     | null: false                    |

### Association
- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :addresses
- belongs_to :users

## addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal-code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building-name   | string     | null: false                    |
| tell-phone      | string     | null: false                    |

### Association
- has_one :purchases
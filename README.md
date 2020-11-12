#　テーブル設計

## users テーブル

| Column         　| Type      | Options                |
| ---------------　| ----------| -----------------------|
| nickname       　| string    | null: false            |
| e-mail         　| string    | null: false            |
| password       　| string    | null: false            |
| last_name      　| string    | null: false            |
| first_name     　| string    | null: false            |
| last_name_kana 　| string    | null: false            |
| first_name_kana　| string    | null: false            |
| birth_date     　| date      | null: false            |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column         　 | Type      | Options                        |
| ---------------　 | ----------| -------------------------------|
| item_title     　 | string    | null: false                    |
| price          　 | integer   | null: false                    |
| description    　 | text      | null: false                    |
| user           　 | string    | null: false                    |
| category       　 | string    | null: false                    |
| status         　 | string    | null: false                    |
| shipping_fee   　 | string    | null: false                    |
| area           　 | string    | null: false                    |
| guideline      　 | string    | null: false                    |
| user           　 | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase

## comments テーブル

| Column         　 | Type      | Options                        |
| ---------------　 | ----------| -------------------------------|
| text           　 | text      | null: false                    |
| user           　 | reference | null: false, foreign_key: true |
| item          　  | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column            | Type      | Options                        |
| ------------------| ----------| -------------------------------|
| card_information  | integer   | null: false                    |
| expiration_date   | integer   | null: false                    |
| security_code     | integer   | null: false                    |
| user              | reference | null: false, foreign_key: true |
| item              | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one    :address

## addresses　テーブル

| Column            | Type      | Options                        |
| ------------------| ----------| -------------------------------|
| post_number       | integer   | null: false                    |
| prefecture        | string    | null: false                    |
| municipality      | string    | null: false                    |
| house_number      | string    | null: false                    |
| building_name     | string    | null: false                    |
| phone_number      | integer   | null: false                    |
| purchase          | reference | null: false, foreign_key: true |
| user              | reference | null: false, foreign_key: true |
| item              | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase
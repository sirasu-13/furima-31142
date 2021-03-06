#　テーブル設計

## users テーブル

| Column         　| Type      | Options                |
| ---------------　| ----------| -----------------------|
| nickname       　| string    | null: false            |
| email          　| string    | null: false            |
|encrypted_password| string    | null: false            |
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
| title          　 | string    | null: false                    |
| price          　 | integer   | null: false                    |
| description    　 | text      | null: false                    |
| category_id    　 | integer    | null: false                    |
| status_id      　 | integer    | null: false                    |
| shipping_fee_id　 | integer    | null: false                    |
| area_id        　 | integer    | null: false                    |
| guideline_id   　 | integer    | null: false                    |
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
| user              | reference | null: false, foreign_key: true |
| item              | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one    :address
- belongs_to :user
## addresses　テーブル

| Column            | Type      | Options                        |
| ------------------| ----------| -------------------------------|
| post_number       | string    | null: false                    |
| prefecture_id     | integer   | null: false                    |
| municipality      | string    | null: false                    |
| house_number      | string    | null: false                    |
| building_name     | string    |                                |
| phone_number      | string    | null: false                    |
| purchase          | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase
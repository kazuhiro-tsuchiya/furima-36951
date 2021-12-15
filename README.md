# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| lastName           | string | null: false               |
| firstName          | string | null: false               |
| lastName_kana      | string | null: false               |
| firstName_kana     | string | null: false               |
| birth              | date   | null: false               |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_explain    | text       | null: false                    |
| category_id     | integer    | null: false                    |
| quality_id      | integer    | null: false                    |
| burden_id       | integer    | null: false                    |
| area_id         | integer    | null: false                    | 
| delivery_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true | 
| user          | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true | 

### Association
- belongs_to :purchase
 
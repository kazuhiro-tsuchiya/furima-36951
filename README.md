# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| okurikana          | string | null: false               |
| birth              | string | null: false               |

### Association
- has_many :items
- has_many :purchase


## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    | 
| item_name     | string     | null: false                    |
| item_explain  | text       | null: false                    |
| category      | string     | null: false                    |
| quality       | string     | null: false                    |
| burden        | string     | null: false                    |
| area          | string     | null: false                    | 
| delivery_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase


## purchases

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_info     | bigint     | null: false                    |
| card_expiry   | smallint   | null: false                    |
| security_code | smallint   | null: false                    |
| item          | references | null: false, foreign_key: true | 
| user          | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- has_many :items
- has_one :address


## addresses 

| Column        | Type     | Options     |
| ------------- | ---------| ----------- |
| post_code     | smallint | null: false |
| prefecture    | string   | null: false |
| city          | string   | null: false |
| street        | string   | null: false |
| building_name | string   | null: true  |
| phone_number  | integer  | null: false |

### Association
- belongs_to :purchase
 
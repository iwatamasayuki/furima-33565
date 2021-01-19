# README

## usersテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| nickname           | string     | nill:false               |
| email              | string     | nill:false,  unique:true | 
| encrypted_password | string     | nill:false               |
| first_name         | string     | nill:false               |
| last_name          | string     | nill:false               |
| first_name_kana    | string     | nill:false               |
| last_name_kana     | string     | nill:false               |
| birthday           | date       | nill:false               |

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| product_name       | string     | nill:false               |
| explanation        | text       | nill:false               |
| category_id        | integer    | nill:false               |
| state_id           | integer    | nill:false               |
| delivery_fee_id    | integer    | nill:false               |
| shipment_source_id | integer    | nill:false               |
| required_day_id    | integer    | nill:false               |
| price              | integer    | nill:false               |

### Association
- belongs_to :user
- has_one    :purchase_records


## purchase_recordsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :street


## streetsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal          | string     | null: false                    |
| prefecture_id   | integer    | nill: false                    |
| minicipalities  | string     | null: false                    |
| building        | string     |                                |
| residence       | string     | null: false                    |
| phone           | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record
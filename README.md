# README

## userテーブル

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
- has_many :Purchase_records


## itemsテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| product_name       | string     | nill:false               |
| explanation        | text       | nill:false               |
| category_id        | integer    | ActiveHashで実装          |
| state_id           | integer    | ActiveHashで実装          |
| delivery_fee_id    | integer    | ActiveHashで実装          |
| shipment_source_id | integer    | ActiveHashで実装          |
| Required_days_id   | integer    | ActiveHashで実装          |
| price              | integer    | nill:false               |

### Association
- belongs_to :user
- has_one    :Purchase_records


## Purchase_recordテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :street


## streetテーブル

| Column         | Type       | Options         |
| -------------- | ---------- | --------------- |
| postal         | integer    | null: false     |
| prefectures_id | integer    | ActiveHashで実装 |
| minicipalities | string     | null: false     |
| residence      | string     | null: false     |
| phone          | integer    | null: false     |

### Association
- belongs_to :Purchase_record
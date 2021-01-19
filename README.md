# README

## userテーブル

| Column          | Type       | Options                  |
| --------------- | ---------- | ------------------------ |
| nickname        | string     | nill:false               |
| email           | string     | nill:false,  unique:true | 
| password        | string     | nill:false               |
| first_name      | string     | nill:false               |
| last_name       | string     | nill:false               |
| first_name_kana | string     | nill:false               |
| last_name_kana  | string     | nill:false               |
| birthday        |            | ActiveHashで実装          |

### Association
- has_many :items
- has_many :Purchase_record


## itemsテーブル

| Column          | Type       | Options                  |
| --------------- | ---------- | ------------------------ |
| product_image   |            | Active storageで実装      |
| product_name    | string     | nill:false               |
| explanation     | text       | nill:false               |
| category        |            | ActiveHashで実装          |
| state           |            | ActiveHashで実装          |
| delivery_fee    |            | ActiveHashで実装          |
| shipment_source |            | ActiveHashで実装          |
| Required_days   |            | ActiveHashで実装          |
| price           | integer    | nill:false               |

### Association
- belongs_to :user
- has_one    :Purchase_record


## Purchase_recordテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- has_one    :street


## streetテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal         |            | ActiveHashで実装                |
| prefectures    |            | ActiveHashで実装                |
| minicipalities |            | ActiveHashで実装                |
| residence      |            | ActiveHashで実装                |
| phone          |            | ActiveHashで実装                |

### Association
- belongs_to :Purchase_record
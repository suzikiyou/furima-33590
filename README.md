# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false,unique: true|
| encrypted_password | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_date         | date                | null: false             |

### Association

* has_many :items
* has_many :purchases


## items table
| Column                | Type                | Options                                  |
|--------------------   |---------------------|-------------------------                 |
| proprietary_name      | string              | null: false                              |
| product_description   | text                | null: false                               |
| category_id           | integer             | null: false                              |
| condition_id          | integer             | null: false                              |
| shipping_charge_id    | integer             | null: false                              |
| prefectures_id        | integer             | null: false                              |
| days_id               | integer             | null: false                              |
|                  | integer             | null: false                              |
| user                  | references          | null: false, foreign_key: true           |

### Association

- belongs_to :user
- has_one : purchase


##  purchases table

| Column      | Type       | Options                        |
|-------------|------------|-------------------             |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : purchase_address


## purchase_address 
| Column             | Type       | Options           |
|-------------       |------------|-------------------|
| zip_code           | string     | null: false       |
| prefecture_id     | integer    | null: false       |
| municipality       | string     | null: false       |
| street_number      | string     | null: false       |
| building_name      | string     |                   |
| telephone_number   | string     | null: false       |
| purchase           | references | null: false, foreign_key: true |


### Association
- belongs to : purchase
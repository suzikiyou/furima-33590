# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_katakana | string              | null: false             |
| first_name_katakana| string              | null: false             |
| date_of_birth      | date                | null: false             |

### Association

* has_many :items
* has_many : purchases


## items table
| Column                | Type                | Options                                  |
|--------------------   |---------------------|-------------------------                 |
| proprietary_name      | string              | null: false                              |
| Product description   | text                | null:false                               |
| category_id           | integer             | null: false                              |
| condition_id          | integer             | null: false                              |
| Prefectures_id        | integer             | active hash                              |
| days_id               | integer             | null: false                              |
| price                 | integer             | null: false                              |
| compounding_fee_id    | integer             | null: false                              |
| exhibition_id         | integer             | null: false                              |
| user                  | references          | null: false, foreign_key: true           |

### Association

- belongs_to :user
- has_many : purchases


##  purchase table

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
| prefectures        | string     | null: false       |
| municipality       | string     | null: false       |
| street_number      | string     | null: false       |
| building_name      | string     |                   |
| telephone_number   | string     | null: false       |

### Association
- belongs to : purchase
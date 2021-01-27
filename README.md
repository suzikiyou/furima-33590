# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| name_katakana      | string              | null: false             |
| date_of_birth      | string              | null: false             |

### Association

* has_many :items
* has_many : purchase


## items table
| Column                | Type                | Options                                  |
|--------------------   |---------------------|-------------------------                 |
| proprietary_name      | string              | null: false                              |
| legend                | text                | null: false                              |
| category_id           | integer             | null: false                              |
| condition_id          | integer             | null: false                              |
| delivery_charge_id    | integer             | null: false                              |
| days_id               | integer             | null: false                              |
| price_id              | integer             | null: false                              |
| compounding_fee_id    | integer             | null: false                              |
| sales_profit_id       | integer             | null: false                              |
| exhibition_id         | integer             | null: false                              |
| user                  | references          | null: false, foreign_key: true           |

### Association

- belongs_to :user
- has_many : purchases


##  purchases table

| Column      | Type       | Options                        |
|-------------|------------|-------------------             |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : Purchase address and buyer


## Purchase address and buyer
| Column             | Type       | Options           |
|-------------       |------------|-------------------|
| INFORMATION_CARD   | string     | null: false       |
| validated_date     | string     | null: false       |
|	Card_security_code | string     | null: false       |
| zip_code           | string     | null: false       |
| prefectures        | string     | null: false       |
| municipality       | string     | null: false       |
| street_number      | string     | null: false       |
| building_name      | string     |                   |
| telephone_number   | string     | null: false       |

### Association
- belongs to : purchase
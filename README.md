# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| Name katakana      | string              | null: false             |
| date of birth      | string              | null: false             |

### Association

* has_many :items
* has_many : purchase


## items table
| Column                | Type                | Options                 |
|--------------------   |---------------------|-------------------------|
| proprietary name      | string              | null: false             |
| legend                | text                | null: false             |
| category_id           | integer             | null: false             |
| condition             | integer             | null: false             |
| delivery charge       | integer             | null: false             |
| days                  | integer             | null: false             |
| price                 | integer             | null: false             |
| compounding fee       | integer             | null: false             |
| sales profit          | integer             | null: false             |
| exhibition            | integer             | null: false             |
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
| INFORMATION CARD   | references | foreign_key: tru  |
| validated date     | references | foreign_key: tru  |
|	Card security code | references | foreign_key: tru  |
| zip code           | references | foreign_key: tru  |
| prefectures        | string     | null: false       |
| municipality       | string     | null: false       |
| street number      | string     | null: false       |
| building name      | string     | null: false       |
| telephone number   | string     | null: false       |

### Association
- belongs to : purchases
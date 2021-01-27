# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
|             |

### Association

* has_many :items
* has_many : purchase

## items table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| exhibitor          | string              | null: false             |
| product            | string              | null: false             |
| price              | string              | null: false             |
| category           | string              | null: false             |
| user               | string              | null: false



### Association

- belongs_to :user
- has_many : purchases

##  purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : 

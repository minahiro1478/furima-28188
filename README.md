# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル
| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | encrypted_password | null: false |
| first_name      | string | null: false |
| last_name       | string | null false  |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date| null: false |


### Association
- has_many: products
- has_many: user-evaluates
- has_many: messages
- has_many: comments
- has_many: orders
- has_many: ship_to-addresses
- has_one: address
- has_one: creditcards







## productsテーブル
| Column           | Type       | Options     |
| --------        　| ------ 　　| ----------- |
| name             | string     | null: false, index: true |
| price            | integer    | null: false |
| explain          | text       | null: false |
| status_id           | integer    | null: false |
| prefecture_id    | integer    | null: false |
| postage_id          | integer     | null: false |
| shipping_date_id    | integer     | null: false |
| user_id                | string | null: false  |


### Association
- belongs_to : user
- has_many : comments
- has_many : product-images
- has_one: order
- belongs_to : categories



## addressesテーブル
| Column           | Type       | Options     |
| perchase         | references | null: false, foreign_key: true |
| postal_code_id      | string     | null: false |
| prefecture_id      | integer    |null: false |
| city             | string     |null: false |
| address          | string     |null: false |
| apartment        | string	    |
| phone_number    |string       |null: false |

### Association
- belong_to : user


## perchaseテーブル
| Column           | Type       | Options     |
| user     | reference | null: false,foreign_key:true |
| product | reference | null: false,foreign_key:true |

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


usersテーブル
Column	Type	Options
nickname	string	null: false
email	string	null: false, unique:true
password	string	null: false
first_name	string	null: false
last_name	string	null: false
first_name_kana	string	null: false
last_name_kana	string	null: false
birthday	date	null: false


productsテーブル
Column	Type	Options
name	string	null: false, index: true
price	integer	null: false
explain	text	null: false
status	integer	null: false
prefecture	integer	null: false
size	string	null: false
postage	string	null: false
shipping_date	string	null: false
buyer_id	integer	
reservation_email	string	
user	references	index: true, foreign_key: true


credit_cardsテーブル
Column	Type	Options
user	references	null: false, foreign_key: true
card_company	string	null: false
card_number	string	null: false
card_year	integer	null: false
card_month	integer	null: false
card_pass	integer	null: false
cutomer_id	string	null: false
card_id	string	null: false

credit_cardsテーブル
Column	Type	Options
user	references	null: false, foreign_key: true
card_company	string	null: false
card_number	string	null: false
card_year	integer	null: false
card_month	integer	null: false
card_pass	integer	null: false
cutomer_id	string	null: false
card_id	string	null: false
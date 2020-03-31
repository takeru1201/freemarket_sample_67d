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

# test comment oyatu
# test

+
## userテーブル 
# last name ひらがな
# farstname　ひらがな
# 名前には制限をつけました
# 
|Column|Type|Options|
|------|----|-------|   

|id|references|null: fgalse|            1
|nickname|string|null: false,limit:15|  ２
|Last name|string|null: false,limit:10|  ３    
|Farst name｜string|null: false,limit10|  4
|last name|string|null: false,limit10|    5  
|farst name｜string|null: false,limit10|   6
|Birthday|date|nul: false|                7
|address|string|nul: false|               8
|phone number|integer|nul: false|         9
|password|string|nul: false|              10
|Self-introduction|text|                  11
|Sales|integer|                           12
|point|integer|                           13
# |icon|text|

## association
 has_many :products
 has_many :comments          商品コメント
 has_ many :good btn         良いね
 has_many :Evaluation        評価
 has_one :credit_card        クレジットカード 
 accepts_nested_attributes_for :user_address  アドレス これをつけると更新が楽みたいです！！

## add_index
 add_index :email, unique: true
 add_index :reset_password_token, unique: true



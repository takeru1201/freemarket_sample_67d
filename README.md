# 🔰freemarket_sample_67d  
フリマアプリのクローンサイト  
<p align="center">
  <img src="https://i.gyazo.com/057b6bf9c2476f00f37a02d020570846.jpg" width="80%">
</p>

## 🔎 Explanation  
フリマアプリのクローンサイト。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したサイトです。  
ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。
<p display="flex" align="center">
 <a href="ユーザー登録"><img src="https://i.gyazo.com/2c093a999fd581b5ef162d8a6c5297e8.png" width="30%;" height="300px;" /></a>
 <a href="商品出品"><img src="https://i.gyazo.com/dad53fe1d2775c62d41c04e08be35c37.png" width="30%;" height="300px;" /></a>
 <a href="商品購入"><img src="https://i.gyazo.com/fd66d588097169380ccaf507dbd8be73.jpg" width="30%;" height="300px;" /></a>
</p>  

## 🌐 App URL
### **http://52.196.216.95/**

##  ⭕Installation
```
$ git clone https://github.com/takeru1201/freemarket_sample_67d.git
$ cd freemarket_sample_67d
$ bundle install
```
##  🔗 BasicAuthentication
Basic認証をかけています。ご覧の際は以下のIDとPassを入力してください。  
```
ID: furima  Pass: 67d  
```

## ✔️TestUser
テスト用アカウント
```
購入者用  
メールアドレス: buyer_user5@gmail.com
パスワード: buyer_user5
```
```
購入用カード情報    
番号： 4242424242424242
期限： 03/21
セキュリティコード：1234
```
```
出品者用  
メールアドレス名: seller_user5@gmail.com
パスワード: seller_user5
```

## 🗿DevelopmentEnvironment
:white_check_mark:Ruby 2.5.1  
:white_check_mark:Ruby on Rails 5.2.4.2  
:white_check_mark:MySQL 5.6.46  
:white_check_mark:Haml 5.1.2  
:white_check_mark:Sass 3.7.4  
:white_check_mark:jQuery 3.4.1  
:white_check_mark:Rspec 3.9  
:white_check_mark:AWS:
EC2
S3  
:white_check_mark:Github



## ⚡DB設計

### Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_number|string|null: false|
|self_introduction|text||
|sales|integer||
|point|integer||
|icon|text||
|birthday|date||
|email|string|default: "", null: false|
|encrypted_password|string||
|reset_password_token|string|null: false|
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|address_id|bigint||
#### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :items_statuses
- has_one :credit
- one :address
- accepts_nested_attributes_for :address
#### add_index
- add_index :address_id
- add_index :email
- add_index :reset_password_token


### Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|item_name|string|null: false|
|price|integer|null: false|
|category_id|bigint|null: false|
|status_id|integer|null: false|
|size|string||
|delivery_method_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|estimated_delivery_id|integer|null: false|
|brind_id|bigint||
|prefecture_id|integer||
|buyer_id|bigint||
#### Association
- has_many :item_comments
- has_many :likes
- has_many :items_statuses
- has_many :item_images
- accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true
- accepts_nested_attributes_for :brand
- belong_to :brand, optional: true
- belong_to :user
- belong_to :categroy
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :delivery_method
- belongs_to_active_hash :estimated_delivery
- belongs_to_active_hash :status
#### add_index
- add_index :user_id
- add_index :category_id
- add_index :brand_id

### Items_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|item_id|bigint|null: false|
|item_comment|text|null: false|
#### Association
- belongs_to :item
- belongs_to :user
#### add_index
- add_index :user_id
- add_index :item_id

### likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false| 
|item_id|bigint|null: false|
#### Association
- belongs_to :item
- belongs_to :user
#### add_index
- add_index :user_id
- add_index :item_id

### Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|building|string||
|house_number|string|null: false|
#### Association
- belongs_to :user, optional: ture
#### add_index
- add_index :user

### Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|costomer_id|string|null: false|
|card_id|string|null: false|
#### Association
- belongs_to :user

### Evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|null :false|
|evaluation|text|null: false|
#### Association
- belongs_to :user

### Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|ancestry|string||
#### Association
- has_many :items
- has_ancestry
- has_many :item_images
- accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true

### Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null:false|
|item_id|integer|null :false|
#### Association
- mount_uploader :src, ImageUploader
- belong_to :item

### Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|

#### Association
- has_many :items

## :ledger:License
[MIT](https://github.com/takeru1201/freemarket_sample_67d/blob/master/LICENSE)

## :dancers:Author
[keisuke-oyatu](https://github.com/keisuke-oyatu)  
[taku-tky-0609](https://github.com/taku-tky-0609)  
[ta1ka2shi3](https://github.com/ta1ka2shi3)  
[irietoshinari](https://github.com/irietoshinari)  
[takeru1201](https://github.com/takeru1201)

# Thanks for watching!!!:smile:
#  

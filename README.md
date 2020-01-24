## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string| unique: true,null:false|
|password_digest|string|

### Association
belongs_to :user
belongs_to :group

## groupテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :group_users
- has_many :users
- has_many :users,throuth: :group_users

## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
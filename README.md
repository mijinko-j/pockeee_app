## テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| family_name        | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |

### Association

- has_many :members
- has_many :items
- has_many :posts
- has_many :comments


## members テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| fixed    | integer    | null: false                    |
| color    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :posts
- has_many :comments

## items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| price  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :posts

## posts テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| day    | date       | null: false                    |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |
| member | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :member
- has_many :comments

## comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| text           | comment    | null: false                    |
| comment_member | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| member         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :member
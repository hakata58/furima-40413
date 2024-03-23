# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
|  nickname          | string | null: false               |
|  email             | string | null: false,unique: true  |
|  encrypted_password| string | null: false,              |
|  surname           | string | null: false               |
|  name              | string | null: false               |
|  surname_katakana  | string | null: false               |
|  name_katakana     | string | null: false               |
|  birthdate         | date   | null: false               |


### Association

- has_many :items
- has_many :buys


## items テーブル

| Column       | Type         | Options                        |
| ------------ | -------------| ------------------------------ |
|  items_name  |  string      |  null: false                   |
|  explanation |  text        |  null: false                   |
|  category_id |  integer     |  null: false                   |
|  situation_id|  integer     |  null: false                   |
|  delivery_id |  integer     |  null: false                   |
|  prefecture_id |  integer     |  null: false                   |
|  day_id      |  integer     |  null: false                   |
|  price       |  integer     |  null: false                   |
|  user        |  references  |  null: false,foreign_key: true |


### Association

- has_one :address
- belongs_to :user


## buys テーブル

| Column        | Type       | Options                         |
| --------------| ---------- | ------------------------------  |
| item          | references | null: false,foreign_key: true   |
| user          | references | null: false,foreign_key: true   |



### Association

- belongs_to :user
- belongs_to :item
- has_one :address





# addresses テーブル

| Column              | Type   | Options                   |
| ------------------  | ------ | --------------------------|
|  post_code          | string | null: false               |
|  prefecture_id     | integer| null: false              |
|  municipaloties     | string | null: false               |
|  street_address     | string | null: false               |
|  building_name      | string |                           |
|  telephone          | string | null: false               |
|  buy               |references| null: false,foreign_key: true |

### Association

- belongs_to :buy
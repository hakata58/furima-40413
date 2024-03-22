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
|  itemsname   |  string      |  null: false                   |
|  explanation |  text        |  null: false                   |
|  category_id |  integer     |  null: false                   |
|  situation_id|  integer     |  null: false                   |
|  delivery_id |  integer     |  null: false                   |
|  former_id   |  integer     |  null: false                   |
|  day_id      |  integer     |  null: false                   |
|  price       |  string      |  null: false                   |
|  commission  |  nteger      |  null: false                   |
|  profit      |  integer     |  null: false                   |
|  user_id     |  references  |  null: false,foreign_key: true |


### Association

- has_many :buy
- belongs_to :users


## buy テーブル

| Column        | Type       | Options                         |
| --------------| ---------- | ------------------------------  |
| item_id       | references | null: false,foreign_key: true   |
| user_id       | references | null: false,foreign_key: true   |



### Association

- belongs_to :users 
- belongs_to :items
- has_one :address





# address テーブル

| Column              | Type   | Options                   |
| ------------------  | ------ | --------------------------|
|  post_code          | string | null: false               |
|  prefectures        | string | null: false               | 
|  municipaloties     | string | null: false               |
|  street_address     | string | null: false               |
|  building_name      | string |                           |
|  telephone          | string | null: false               |
|  buy_id            |references| null: false,foreign_key: true |

### Association

- belongs_to :buy
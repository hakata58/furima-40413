class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      
      t.string :items_name
      t.text :explanation
      t.string :category_id
      t.string :situation_id
      t.string :delivery_id
      t.string :prefectures_id
      t.string :day_id
      t.integer :price
      t.string :users_id


      t.timestamps
    end
  end
end

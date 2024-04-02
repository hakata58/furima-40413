class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      
      t.string :items_name,     null: false
      t.text :explanation,     null: false
      t.integer :category_id,     null: false
      t.integer :situation_id,     null: false
      t.integer :delivery_id,     null: false
      t.integer :prefectures_id,     null: false
      t.integer :day_id,     null: false
      t.integer :price,     null: false
      t.references :user,     null: false,foreign_key: true


      t.timestamps
    end
  end
end

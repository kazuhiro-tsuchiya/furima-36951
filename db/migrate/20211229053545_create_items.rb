class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,        null: false
      t.text :item_explain,       null: false
      t.integer :category_id,     null: false
      t.integer :quality_id,      null: false
      t.integer :burden_id,       null: false
      t.integer :area_id,         null: false
      t.integer :delivery_day_id, null: false
      t.integer :price,           null: false
      t.references :user,         null: false, foreign_key: true

      t.timestamps
      
    end
  end
end

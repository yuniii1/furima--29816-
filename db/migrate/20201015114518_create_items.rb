class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :delivery_date_id
      t.integer :shipping_id
      t.integer :shipment_source_id
      t.references :user
      t.integer :price  
      t.timestamps
    end
  end
end

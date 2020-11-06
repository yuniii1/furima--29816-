class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.integer :prefectures_id
      t.string :municipality
      t.string :address
      t.string :building_name
      t.string :tell_phone
      t.references :purchase
      t.timestamps
    end
  end
end

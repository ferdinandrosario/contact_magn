class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :add_one
      t.string :country
      t.integer :contact_id
      t.boolean :is_primary

      t.timestamps null: false
    end
  end
end

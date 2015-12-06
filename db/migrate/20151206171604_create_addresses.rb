class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :district
      t.string :zip_code
      t.string :city
      t.string :estate
      t.string :country
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

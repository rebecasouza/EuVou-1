class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :location
      t.float :lat
      t.float :lon
      t.references :event

      t.timestamps null: false
    end
  end
end

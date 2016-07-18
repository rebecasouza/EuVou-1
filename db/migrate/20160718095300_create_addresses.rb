class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :lat
      t.string :lon
      t.string :location
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end

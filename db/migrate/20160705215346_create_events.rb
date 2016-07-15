class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :time
      t.boolean :active

      t.timestamps
    end
  end
end

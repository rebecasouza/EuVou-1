class AddPlaceToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :place, :string
  end
end

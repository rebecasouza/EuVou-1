class AddAddressToEvent < ActiveRecord::Migration
  def change
    add_column :events, :street, :string
    add_column :events, :number, :string
    add_column :events, :district, :string
    add_column :events, :zip_code, :string
    add_column :events, :city, :string
    add_column :events, :estate, :string
    add_column :events, :country, :string
  end
end

class AddImagesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :images, :json
  end
end

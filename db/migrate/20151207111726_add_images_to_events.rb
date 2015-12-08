class AddImagesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :images, :text
  end
end

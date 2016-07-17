class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
			t.references :reported_event, index: true, foreign_key: true

      t.timestamps
    end

    add_index :reports, [:reported_event_id], unique: true
  
  end
end

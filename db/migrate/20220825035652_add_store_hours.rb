class AddStoreHours < ActiveRecord::Migration[5.2]
  def change
    create_table :store_hours do |t|
      t.string :day
      t.integer :day_type
      t.time :opening_time
      t.time :closing_time
      t.boolean :is_closed, default: false
      t.boolean :is_active, defaut: false
      t.timestamps null: false
    end     
  end
end

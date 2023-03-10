class AddEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :start_time
      t.time :end_time
      t.timestamps null: false
    end
  end
end

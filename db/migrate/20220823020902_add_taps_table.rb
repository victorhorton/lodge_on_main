class AddTapsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :taps do |t|
      t.string :title
      t.string :description
      t.integer :position
      t.boolean :in_stock
      t.timestamps null: false
    end    
  end
end

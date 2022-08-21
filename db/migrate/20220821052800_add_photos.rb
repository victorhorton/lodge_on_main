class AddPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
      t.string "title"
      t.string "description"
    end
  end
end

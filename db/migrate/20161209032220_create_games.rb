class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :thumb_url
      t.string :image_url
      t.string :category

      t.timestamps
    end
  end
end

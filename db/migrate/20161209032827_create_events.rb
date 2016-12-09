class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :datetime
      t.integer :min_players
      t.integer :max_players
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end

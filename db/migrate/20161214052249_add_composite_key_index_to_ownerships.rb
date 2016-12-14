class AddCompositeKeyIndexToOwnerships < ActiveRecord::Migration[5.0]
  def change
    add_index :ownerships, [:user_id, :game_id], unique: true
  end
end

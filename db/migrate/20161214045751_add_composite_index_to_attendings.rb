class AddCompositeIndexToAttendings < ActiveRecord::Migration[5.0]
  def change
    add_index :attendings, [:user_id, :event_id], unique: true
  end
end

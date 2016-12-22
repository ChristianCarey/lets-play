class RenameAttendingsToReservations < ActiveRecord::Migration[5.0]
  def change
    rename_table :attendings, :reservations
  end
end

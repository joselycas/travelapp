class DropTripActivities < ActiveRecord::Migration[5.2]
  def change
    drop_table :trip_activities
    drop_table :destination_activities
  end
end

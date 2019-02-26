class AddTripActtivitiesIdToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :trip_activities_id, :integer
  end
end

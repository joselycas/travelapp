class RemoveColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :destination_activities_id
    remove_column :activities, :destination_activities_id
    remove_column :activities, :trip_activities_id
    add_column :activities, :destination_id, :integer
    add_column :activities, :trip_id, :integer
    add_column :destinations, :trip_id, :integer
    add_column :trip_destinations, :cost, :integer
  end
end

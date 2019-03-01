class AddForeignKeyToDestinations < ActiveRecord::Migration[5.2]
  def change
      add_column :activities, :destination_activities_id, :integer
      add_column :destinations, :destination_activities_id, :integer
  end
end

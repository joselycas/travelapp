class AddDestinationActivitiesToDestinations < ActiveRecord::Migration[5.2]
  def change
   add_foreign_key :destination_activities, :destinations
   add_foreign_key :destination_activities, :activities
 end
end

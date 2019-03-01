class AddDestinationActivitiesToActivities < ActiveRecord::Migration[5.2]

    def change
   add_foreign_key :destinations, :destination_activities
   add_foreign_key :activities, :destination_activities
 end

end

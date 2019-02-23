class CreateTripActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_activities do |t|
    t.integer  :trip_id
    t.integer  :destination_id
    t.integer  :activity_id
    t.integer  :cost
        t.timestamps
    end
  end
end

class RemoveTripIdDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :trip_id
  end
end

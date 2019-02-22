class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :country
      t.string :state
      t.integer :flight_cost

      t.timestamps
    end
  end
end

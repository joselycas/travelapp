class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :description
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.integer :budget
      t.timestamps
    end
  end
end

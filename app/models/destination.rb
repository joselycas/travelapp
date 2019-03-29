class Destination < ApplicationRecord
  has_many :trip_destinations
  has_many :trips, through: :trip_destinations
  has_many :activities
  accepts_nested_attributes_for :trip_destinations

end

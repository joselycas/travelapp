class Destination < ApplicationRecord
  has_many :trip_destinations
  has_many :trips, through: :trip_destinations
  has_many :activities
  #validates :country, presence: true, allow_blank: false
  #validates :country, uniqueness: true
end

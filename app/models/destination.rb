class Destination < ApplicationRecord
  has_many :trip_activities
  has_many :activities, through: :trip_activities
  validates :country, uniqueness: true
end

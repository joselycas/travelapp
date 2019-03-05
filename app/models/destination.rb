class Destination < ApplicationRecord
  belongs_to :trip
  has_many :trip_destinations
  has_many :trips, through: :trip_destinations
  has_many :activities
  accepts_nested_attributes_for :activities
  validates :country, uniqueness: true
end

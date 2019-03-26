class Destination < ApplicationRecord
  has_many :trip_destinations
  has_many :trips, through: :trip_destinations
  has_many :activities
  accepts_nested_attributes_for :trip_destinations
  scope :country => :destinations, :order => "DESC"
  
  #validates :country, presence: true, allow_blank: false
  #validates :country, uniqueness: true
end

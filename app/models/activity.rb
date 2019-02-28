class Activity < ApplicationRecord
  has_many :trip_activities
  validates :name, uniqueness: true
end

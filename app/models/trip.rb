class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_activities
  has_many :activities, through: :trip_activities
  has_many :destinations, through: :trip_activities
  validates :trip, presence: true, allow_blank: false
  accepts_nested_attributes_for :destinations

end

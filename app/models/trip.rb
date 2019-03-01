class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
  #validates :trip, presence: true, allow_blank: false
  default_scope { order(created_at: :desc) }

end

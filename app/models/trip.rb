class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
  has_many :activities
  validates :description, presence: true, allow_blank: false
  validates :budget, presence: true, allow_blank: false
  default_scope { order(created_at: :desc) }
  scope :desc, order(start_date: :desc)
  
#add scope method for ordering by name in the controller - define here
end

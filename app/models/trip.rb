class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
  has_many :activities
  validates :description, presence: true, allow_blank: false
  validates :budget, presence: true, allow_blank: false
  #validates :start_date, presence: true, allow_blank: false
  #validates :end_date, presence: true, allow_blank: false
  default_scope { order(created_at: :desc) }

end

class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
  has_many :activities
  validates :description, presence: true, allow_blank: false
  validates :budget, presence: true, allow_blank: false
  scope :desc, -> { order(:start_date => :desc)}
  scope :with_destinations, -> { joins(trip_destinations: :destination)}
  scope :group_by_destinations, -> {with_destinations.group("destinations.id")}
  scope :rank_by_destinations, -> {group_by_destinations.select("*, count(trips.id) as total_count").order("total_count desc")}
  scope :top_n_destinations, ->(n) {rank_by_destinations.limit(n) }


  #can be condensed to one class method
end

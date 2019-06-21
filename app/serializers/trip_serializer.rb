class TripSerializer < ActiveModel::Serializer
  attributes :id, :description, :start_date, :end_date
  belongs_to :user
  has_many :trip_destinations
  has_many :activities, serializer: TripActivitiesSerializer

end

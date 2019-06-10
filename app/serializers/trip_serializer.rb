class TripSerializer < ActiveModel::Serializer
  attributes :id, :description, :start_date, :end_date
  has_many :trip_destinations
  has_many :activities

end

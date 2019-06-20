class ActivitiesSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :trip
end

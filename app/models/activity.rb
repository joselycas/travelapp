class Activity < ApplicationRecord
  belongs_to :trip
  belongs_to :destination
  #validates :name, uniqueness: true

end

class TripActivity < ApplicationRecord
  belongs_to :trip
  belongs_to :activity
  belongs_to :destination


end

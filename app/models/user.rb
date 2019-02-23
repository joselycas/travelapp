class User < ApplicationRecord
  has_many :trips
  has_many :destinations
  has_many :activities
  validates :name, presence: true
  validates :email, uniqueness: true
end

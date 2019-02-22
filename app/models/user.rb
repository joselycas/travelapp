class User < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :email, uniqueness: true
end

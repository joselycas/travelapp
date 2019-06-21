class User < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_secure_password
end

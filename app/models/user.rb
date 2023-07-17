class User < ApplicationRecord
  has_many :notes
  has_many :comments
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
end

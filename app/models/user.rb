class User < ApplicationRecord
  has_many :messages

  validates :username, presence: true, length: { minimum: 4, maximum: 40 }, uniqueness: true
  has_secure_password
end

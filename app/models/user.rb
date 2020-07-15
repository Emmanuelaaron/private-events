class User < ApplicationRecord
  validates :email, :username, presence: true
  validates :username, uniqueness: true
end

class User < ApplicationRecord
  validates :email, :username, presence: true
  validates :username, uniqueness: true
  has_many :events
  has_many :attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :attendances
end

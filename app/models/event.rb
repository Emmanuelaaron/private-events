class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id
  has_many :event_attendees, through: :attendances, source: :event_attendee
end

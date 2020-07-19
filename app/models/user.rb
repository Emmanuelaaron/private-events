class User < ApplicationRecord
  validates :email, :username, presence: true
  validates :username, uniqueness: true
  has_many :events
  has_many :attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :attendances

  def upcoming_events
    upcoming_events = []
    attended_events.each do |event|
      upcoming_events << event if event.event_date > Date.today
    end
    upcoming_events
  end

  def past_events
    past_events = []
    attended_events.each do |event|
      past_events << event if event.event_date < Date.today
    end
    past_events
  end
end

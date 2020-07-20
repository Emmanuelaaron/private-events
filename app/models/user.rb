class User < ApplicationRecord
  validates :email, :username, presence: true
  validates :username, :email, uniqueness: true
  has_many :events
  has_many :attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :attendances

  def upcoming_events
    attended_events.where('event_date > ?', Time.now)
  end

  def past_events
    attended_evencts.where('event_date<?', Time.now)
  end
end

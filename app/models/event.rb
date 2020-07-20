class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :event_attendees, through: :attendances, dependent: :destroy
  validates :description, :event_date, presence: true

  scope :past, -> { where('event_date < ?', Time.now) }
  scope :upcoming, lambda {
                     where('event_date >= ?', Time.now)
                       .or(where('event_date IS NULL'))
                   }
end

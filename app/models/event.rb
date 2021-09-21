class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User',
                       inverse_of: :created_events
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances
  validates :name, presence: true
  validates :date, presence: true
  validates :place, presence: true
end

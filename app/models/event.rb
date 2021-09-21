class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User',
                       inverse_of: :created_events
  has_many :attendances, inverse_of: :attended_events
  has_many :attendees, through: :attendance,
                       class_name: 'User',
                       foreign_key: 'attended_event_id'
  validates :name, presence: true
  validates :date, presence: true
  validates :place, presence: true
end

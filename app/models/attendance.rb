class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
  validates_uniqueness_of :attendee_id, scope: [:attended_event_id]
end

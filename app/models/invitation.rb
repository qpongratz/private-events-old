class Invitation < ApplicationRecord
  belongs_to :private_event, class_name: 'Event'
  belongs_to :invitee, class_name: 'User'
  validates_uniqueness_of :invitee_id, scope: [:private_event_id]
end

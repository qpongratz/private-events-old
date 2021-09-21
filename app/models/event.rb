class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User',
                       inverse_of: :created_events
  validates :name, presence: true
  validates :date, presence: true
  validates :place, presence: true
end

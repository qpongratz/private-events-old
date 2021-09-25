# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User',
                       inverse_of: :created_events
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances
  has_many :invitations, foreign_key: 'private_event_id'
  has_many :invitees, through: :invitations
  validates :name, presence: true
  validates :date, presence: true
  validates :place, presence: true
  validates :private, presence: true

  scope :occurred, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }
  scope :common, -> { where('private = ?', false) }
  default_scope { order(date: :desc) }
end

# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: 'Event',
                            foreign_key: 'creator_id',
                            inverse_of: :creator
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances
  has_many :invitations, foreign_key: 'invitee_id'
  has_many :private_events, through: :invitations
end

# frozen_string_literal: true

class AddIndexToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_index :attendances, %i[attendee_id attended_event_id], unique: true
  end
end

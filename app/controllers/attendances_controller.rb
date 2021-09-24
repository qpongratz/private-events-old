# frozen_string_literal: true

class AttendancesController < ApplicationController

  def create
    attendance = Attendance.new(attendance_params)

    if attendance.save
      redirect_to attendance.attended_event
      flash[:notice] = 'You are now attending the event'
    else
      flash[:alert] = 'Uh oh'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    attendance = Attendance.find_by attendee_id: attendance_params[:attendee_id], attended_event_id: attendance_params[:attended_event_id]
    attendance.delete
    flash[:notice] = 'You are no longer attending this event'
    redirect_back(fallback_location: root_path)
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end
end

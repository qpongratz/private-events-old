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

  private

  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end
end

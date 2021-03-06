# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @events = Event.common.all.includes(:creator)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:notice] = 'Event created successfully'
      attendance = { attendee_id: current_user.id, attended_event_id: @event.id }
      Attendance.create(attendance)
      redirect_to @event
    else
      flash.now[:alert] = 'There were errors in your submission'
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = 'Event updated successfully'
      redirect_to @event
    else
      flash.now[:alert] = 'There were errors in your submission'
      render :edit
    end
  end

  def show
    @users = User.all.includes(:private_events)
    @event = Event.all.includes(:attendees, :creator).where(id: params[:id]).first
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    flash[:notice] = 'Event was deleted'
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :name, :place, :private)
  end
end
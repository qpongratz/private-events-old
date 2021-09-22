class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    @events = Event.all.includes(:creator)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.where(id: params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:date, :name, :place)
  end
end
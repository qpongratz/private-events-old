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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_back(fallback_location: root_path)
  end

  private

  def event_params
    params.require(:event).permit(:date, :name, :place)
  end
end
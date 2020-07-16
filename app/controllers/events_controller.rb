class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  def new
    if current_user
      @event = current_user.events.build
    else
      render 'new'
    end
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def event_params
    params.require(:event).permit(:description, :event_date)
  end
end

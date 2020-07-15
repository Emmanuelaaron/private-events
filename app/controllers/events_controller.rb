class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show; end

  def index
    @events = Event.all
  end

  def event_params
    params.require(:event).permit(:description, :event_date)
  end
end

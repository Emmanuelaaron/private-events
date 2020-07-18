class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create index show]
  def new
    @event = Event.new
  end

  def invite
    @event = Event.find(params[:event_id])
    if (user = User.find_by(username: params[:username]))
      if @event.event_attendees.include?(user)
        flash[:danger] = "#{params[:username]} is already invited"
      else
        @event.event_attendees << User.find_by(username: params[:username])
        flash[:success] = "#{params[:username]} successfuly invited!"
      end
    else
      flash[:danger] = 'No such user exits'
    end
    redirect_to @event
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
    if current_user == @event.creator || @event.event_attendees
        .include?(current_user)
    else
      redirect_to current_user
    end
  end

  def index
    @events = Event.all
  end

  def event_params
    params.require(:event).permit(:description, :event_date, :username)
  end
end

class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create index show]
  def new
    @event = Event.new
  end

  def invite
    @event = Event.find(params[:event_id])
    user = User.find_by(username: params[:username])
    if !user.nil?
      if @event.attendees.include?(user)
        flash[:danger] = "#{params[:username].capitalize} is already invited"
      else
        @event.attendees << user
        flash[:success] = "#{params[:username].capitalize} successfuly invited!"
      end
    else
      flash[:danger] = 'No such user exits'
    end
    redirect_to @event
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
      flash[:success] = 'Event successfuly created!'
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
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def event_params
    params.require(:event)
      .permit(:description, :event_date, :username, :event_id)
  end
end

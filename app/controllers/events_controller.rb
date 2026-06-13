class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :show, :index ]

  def index
    @past_events = Event.past.all.includes(:creator)
    @future_events = Event.future.all.includes(:creator)
  end
  def show
    @event = Event.find(params[:id])
    @attendees = @event.invitations.accepted.includes(:attendee)
    @invited = @event.invitations.pending.includes(:attendee)
  end
  def new
    @event = current_user.events.new
  end
  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    return unless current_user == @event.creator
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy if current_user == @event.creator
    redirect_to events_path
  end

  private
  def event_params
    params.expect(event: [ :title, :location, :planned_date, :is_private ])
  end
end

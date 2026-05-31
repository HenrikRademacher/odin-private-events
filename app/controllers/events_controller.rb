class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :show, :index ]

  def index
    @events = Event.all
    @past_events = Event.past.all
    @future_events = Event.future.all
  end
  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
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



  private
  def event_params
    params.expect(event: [ :title, :location, :planned_date ])
  end
end

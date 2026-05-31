class InvitationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @invitation = Invitation.new
    @invitation.attended_event_id = params[:id]
    @invitation.attendee_id = current_user.id
    @invitation.save
    redirect_to Event.find(params[:id])
  end

  def destroy
    @attended_event = Event.find(params[:id])
    current_user.attended_events.destroy(@attended_event)
    redirect_to Event.find(params[:id])
  end
end

class InvitationsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def index
    @invitations = current_user.invitations.includes(:attended_event)
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @event = Event.find(params[:invitation][:attended_event_id])
    @attendee = User.find(params[:invitation][:attendee_id])
    @invitation.attended_event_id = @event.id if @event
    @invitation.attendee_id = @attendee.id if @attendee
    @invitation.accepted = false
    if @invitation.save
      redirect_to @event
    else
      redirect_to @event
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy if @invitation.attendee == current_user
    redirect_to invitations_path
  end

private

def invitation_params
  params.expect(invitation: [ :attendee_id, :attended_event_id ])
end
end

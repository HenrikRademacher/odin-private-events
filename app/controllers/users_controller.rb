class UsersController < ApplicationController
  def show
    @creator = User.find(params[:id])
    @events = @creator.events.all
    @attended = @creator.attended_events.all
  end
end

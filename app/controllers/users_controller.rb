class UsersController < ApplicationController
  def show
    @creator = User.find(params[:id])
    @events = @creator.events.all
  end
end

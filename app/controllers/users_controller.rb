class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events.all
    @attended_events = @user.attended_events.all
  end
end

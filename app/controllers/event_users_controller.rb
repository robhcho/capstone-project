class EventUsersController < ApplicationController
  def create
    new_users_event = EventUser.new(
      user_id: current_user.id,
      event_id: params[:event_id]
      )
  end
end

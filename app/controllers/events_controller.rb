class EventsController < ApplicationController
  def create
    event = Event.new(
      user_id: current_user.id,
      event_title: params[:event_title],
      date_time: params[:date_time],
      event_duration: params[:event_duration]
      )
    if event.save
      render json: event.as_json
    else
      render json: { errors: event.errors.full_messages }
    end
  end
end

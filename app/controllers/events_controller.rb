class EventsController < ApplicationController
  def index
    events = Event.all
    render json: events.as_json
  end

  def show
    event = Event.find(params[:id])
    render json: event.as_json
  end

  def create
    event = Event.new(
      user_id: current_user.id,
      event_title: params[:event_title],
      event_duration: params[:event_duration],
      event_description: params[:event_description],
      group_id: params[group_id]
    )
    if event.save
      render json: event.as_json
    else
      render json: { errors: event.errors.full_messages }
    end
  end
end

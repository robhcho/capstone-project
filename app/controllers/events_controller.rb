class EventsController < ApplicationController
  # def index
  #   events = Group.find(params[:id]).events
  #   render json: events.as_json
  # end

  def show
    events = Group.find(params[:id]).events
    render json: events.as_json
  end

  def create
    group_event = Event.new(
      user_id: current_user.id,
      group_id: params[:id],
      title: params[:title],
      date: params[:date],
      # start: params[:start],
      end_time: params[:end_time]
    )
    if group_event.save
      render json: group_event.as_json
    else
      render json: { errors: group_event.errors.full_messages }
    end
  end
end

class UserCalendarEventsController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      calendar_events = UserCalendarEvent.all
      render json: calendar_events.as_json
    else
      render json: []
    end
  end

  def show
    calendar_event = UserCalendarEvent.find(params[:id])
    render json: calendar_event.as_json
  end

  def create
    calendar_event = UserCalendarEvent.new(
      user_id: current_user.id,
      event_title: params[:event_title],
      date: Date.strptime(params[:date], '%m/%d/%Y'),
      start_time: Time.strptime(params[:start_time], '%l:%M %p'),
      end_time: Time.strptime(params[:end_time], '%l:%M %p')
    )
    if calendar_event.save
      render json: calendar_event.as_json
    else
      render json: { errors: calendar_event.errors.full_messages }
    end
  end

  def update
    calendar_event_id = params[:id]
    calendar_event = UserCalendarEvent.find(calendar_event_id)
    calendar_event.event_title = params[:event_title] || calendar_event.event_title
    calendar_event.date = Date.strptime(params[:date], '%m/%d/%Y') || calendar_event.date
    calendar_event.start_time = Time.strptime(params[:start_time], '%l:%M %p') || calendar_event.start_time
    calendar_event.end_time = Time.strptime(params[:end_time], '%l:%M %p') || calendar_event.end_time
    if calendar_event.save
      render json: calendar_event.as_json
    else
      render json: { errors: calendar_event.errors.full_messages }
    end
  end

  def destroy
    calendar_event_id = params[:id]
    calendar_event = UserCalendarEvent.find(calendar_event_id)
    calendar_event.destroy

    render json: { message: 'event has been deleted' }
  end
end
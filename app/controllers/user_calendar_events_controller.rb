class UserCalendarEventsController < ApplicationController
  # before_action :authenticate_user
  # before_filter :authenticate_user!, except: [:new, :create]
  def index
    # if current_user
      calendar_events = current_user.user_calendar_events
      # p current_user
      render json: calendar_events.as_json
    # else
    #   render json: []
    # end
  end

  def show
      user_calendar = UserCalendarEvent.where(user_id: params[:id])
      render json: user_calendar.as_json
  end

  def create
    calendar_event = UserCalendarEvent.new(
      user_id: current_user.id,
      title: params[:title],
      date: params[:date],
      # start: params[:start],
      end_time: params[:end_time]
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
    calendar_event.title = params[:title] || calendar_event.title
    calendar_event.date = Date.strptime(params[:date], '%m/%d/%Y') || calendar_event.date
    # calendar_event.date = params[:date] || calendar_event.date
    calendar_event.start = Time.strptime(params[:start], '%l:%M %p') || calendar_event.start
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
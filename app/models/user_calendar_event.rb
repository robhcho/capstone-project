class UserCalendarEvent < ApplicationRecord
  belongs_to :user

  def as_json
    {
      event_title: event_title,
      date: date,
      start_time: start_time,
      end_time: end_time
    }
  end
end

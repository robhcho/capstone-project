class UserCalendarEvent < ApplicationRecord
  belongs_to :user

  def as_json
    {
      id: id,
      title: title,
      date: date,
      start: start,
      end: end_time
    }
  end
end

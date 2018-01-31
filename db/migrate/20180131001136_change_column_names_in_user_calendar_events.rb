class ChangeColumnNamesInUserCalendarEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_calendar_events, :event_title, :title
    rename_column :user_calendar_events, :start_time, :start
    rename_column :user_calendar_events, :end_time, :end
  end
end

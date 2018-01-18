class AddColumnToUserCalendar < ActiveRecord::Migration[5.1]
  def change
    add_column :user_calendar_events, :event_title, :string
  end
end

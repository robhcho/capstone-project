class ChangeDataType < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_calendar_events, :start, :time
    add_column :user_calendar_events, :start, :datetime
    remove_column :user_calendar_events, :end_time, :time
    add_column :user_calendar_events, :end_time, :datetime
  end
end

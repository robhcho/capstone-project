class ChangeNameOfEndColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_calendar_events, :end, :end_time
  end
end

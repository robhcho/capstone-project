class CreateUserCalendarEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_calendar_events do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :user_id

      t.timestamps
    end
  end
end

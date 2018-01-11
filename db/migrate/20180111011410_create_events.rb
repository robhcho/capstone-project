class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :date_time
      t.string :event_title
      t.string :event_description
      t.string :event_duration

      t.timestamps
    end
  end
end

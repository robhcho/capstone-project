class ChangeAndAddColumnNamesInEventModel < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :event_title, :title
    add_column :events, :start, :datetime
    add_column :events, :end_time, :datetime
  end
end

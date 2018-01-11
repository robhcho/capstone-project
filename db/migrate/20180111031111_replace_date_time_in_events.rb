class ReplaceDateTimeInEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :date_time, :string
    add_column :events, :date_time, :datetime
  end
end

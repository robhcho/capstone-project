class ChangeDataTypesOfStartEndTimeInOccurrences < ActiveRecord::Migration[5.1]
  def change
    remove_column :occurrences, :start_time, :integer
    add_column :occurrences, :start_time, :time
    remove_column :occurrences, :end_time, :integer
    add_column :occurrences, :end_time, :time



  end
end

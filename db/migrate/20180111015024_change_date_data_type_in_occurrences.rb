class ChangeDateDataTypeInOccurrences < ActiveRecord::Migration[5.1]
  def change
    change_column :occurrences, :date, 'date USING date::date'
  end
end

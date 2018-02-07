class ChangeColumnNameInEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :date_time, :date
  end
end

class AddUserIdColumnToOccurrences < ActiveRecord::Migration[5.1]
  def change
    add_column :occurrences, :user_id, :integer
  end
end

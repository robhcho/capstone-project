class ChangeEventIdDataTypeInPolls < ActiveRecord::Migration[5.1]
  def change
    change_column :polls, :event_id, 'integer USING event_id::integer'
  end
end

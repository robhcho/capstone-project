class CreateEventGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :event_groups do |t|
      t.integer :event_id
      t.integer :group_id

      t.timestamps
    end
  end
end

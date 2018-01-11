class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :first_possible_date
      t.string :second_possible_date
      t.string :third_possible_date
      t.string :event_id

      t.timestamps
    end
  end
end

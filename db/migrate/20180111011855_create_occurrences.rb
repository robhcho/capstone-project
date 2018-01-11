class CreateOccurrences < ActiveRecord::Migration[5.1]
  def change
    create_table :occurrences do |t|
      t.string :date
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end

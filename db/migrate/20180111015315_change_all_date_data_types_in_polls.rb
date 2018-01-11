class ChangeAllDateDataTypesInPolls < ActiveRecord::Migration[5.1]
  def change
    change_column :polls, :first_possible_date, 'date USING first_possible_date::date'
    change_column :polls, :second_possible_date, 'date USING second_possible_date::date'
    change_column :polls, :third_possible_date, 'date USING third_possible_date::date'
  end
end

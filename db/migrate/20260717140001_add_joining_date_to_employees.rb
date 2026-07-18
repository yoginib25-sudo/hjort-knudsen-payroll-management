class AddJoiningDateToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_column :employees, :joining_date, :date
  end
end

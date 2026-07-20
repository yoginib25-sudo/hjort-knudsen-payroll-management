class AddDesignationToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_column :employees, :designation, :string
  end
end

class AddPasswordToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_column :employees, :password, :string
  end
end
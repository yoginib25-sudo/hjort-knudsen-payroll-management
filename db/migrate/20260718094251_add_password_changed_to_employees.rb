class AddPasswordChangedToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_column :employees, :password_changed, :boolean, default: false
  end
end
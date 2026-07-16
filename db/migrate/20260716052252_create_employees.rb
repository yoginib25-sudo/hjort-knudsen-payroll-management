class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :employee_id
      t.string :department
      t.string :email

      t.timestamps
    end
  end
end

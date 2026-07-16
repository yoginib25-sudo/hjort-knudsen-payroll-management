class CreateSalarySlips < ActiveRecord::Migration[8.1]
  def change
    create_table :salary_slips do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :month
      t.integer :year
      t.decimal :basic_salary
      t.decimal :allowances
      t.decimal :deductions
      t.decimal :net_salary

      t.timestamps
    end
  end
end

class AddPayrollFieldsToSalarySlips < ActiveRecord::Migration[8.1]
  def change
    add_column :salary_slips, :hra, :decimal
    add_column :salary_slips, :transport_allowance, :decimal
    add_column :salary_slips, :medical_allowance, :decimal
    add_column :salary_slips, :special_allowance, :decimal
    add_column :salary_slips, :other_allowances, :decimal
    add_column :salary_slips, :pf, :decimal
    add_column :salary_slips, :professional_tax, :decimal
    add_column :salary_slips, :tds, :decimal
    add_column :salary_slips, :loan_deduction, :decimal
    add_column :salary_slips, :other_deductions, :decimal
    add_column :salary_slips, :gross_salary, :decimal
  end
end

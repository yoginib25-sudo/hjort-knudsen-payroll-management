class SalarySlip < ApplicationRecord
  belongs_to :employee

  before_save :calculate_salary

  private

  def calculate_salary
    self.hra = basic_salary.to_f * 0.40
    self.transport_allowance = basic_salary.to_f * 0.10
    self.medical_allowance = basic_salary.to_f * 0.05
    self.special_allowance = basic_salary.to_f * 0.05
    self.other_allowances = basic_salary.to_f * 0.05

    self.allowances =
      hra +
      transport_allowance +
      medical_allowance +
      special_allowance +
      other_allowances

    self.gross_salary = basic_salary + allowances

    self.pf = basic_salary.to_f * 0.12
    self.professional_tax = 200
    self.tds = basic_salary.to_f * 0.05

    self.deductions =
      pf +
      professional_tax +
      tds +
      loan_deduction.to_f +
      other_deductions.to_f

    self.net_salary = gross_salary - deductions
  end
end
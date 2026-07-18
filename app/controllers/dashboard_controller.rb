class DashboardController < ApplicationController

  before_action :require_admin_login


  def index

    @total_employees = Employee.count

    @total_salary_slips = SalarySlip.count

    @total_payroll = SalarySlip.sum(:net_salary)


    @recent_employees = Employee.order(created_at: :desc).limit(5)

    @recent_salary_slips = SalarySlip.order(created_at: :desc).limit(5)

  end



  private


  def require_admin_login

    unless session[:admin_logged_in]

      redirect_to admin_login_path

    end

  end


end
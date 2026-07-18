class EmployeePortalController < ApplicationController

  def login
    return unless request.post?

    employee = Employee.find_by(employee_id: params[:employee_id])

    if employee && employee.password == params[:password]

      session[:employee_id] = employee.id

      if employee.password_changed
        redirect_to employee_dashboard_path
      else
        redirect_to change_password_path
      end

    else

      flash.now[:alert] = "Invalid Employee ID or Password"

    end
  end

  def dashboard
    @employee = Employee.find_by(id: session[:employee_id])

    unless @employee
      redirect_to employee_login_path
      return
    end

    @salary_slips = @employee.salary_slips
  end

  def logout
    reset_session
    redirect_to employee_login_path
  end

end
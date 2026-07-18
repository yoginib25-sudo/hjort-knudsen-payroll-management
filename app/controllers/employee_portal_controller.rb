class EmployeePortalController < ApplicationController
  def login
    if request.post?
      employee = Employee.find_by(employee_id: params[:employee_id])

      if employee && employee.password == params[:password]
        session[:employee_id] = employee.id
        redirect_to employee_dashboard_path
      else
        flash.now[:alert] = "Invalid Employee ID or Password"
      end
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
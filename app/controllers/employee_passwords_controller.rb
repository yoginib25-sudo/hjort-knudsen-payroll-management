class EmployeePasswordsController < ApplicationController

  def new
    @employee = Employee.find(session[:employee_id])
  end

  def update
    @employee = Employee.find(session[:employee_id])

    if params[:password] == params[:password_confirmation]

      @employee.update(
        password: params[:password],
        password_changed: true
      )

      redirect_to employee_dashboard_path,
                  notice: "Password changed successfully."

    else

      flash.now[:alert] = "Passwords do not match."
      render :new

    end

  end

end
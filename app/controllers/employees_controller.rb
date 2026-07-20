class EmployeesController < ApplicationController

  before_action :require_admin_login


  def index

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end


    if params[:search].present?

      search_term = "%#{params[:search]}%"


      @employees = Employee.where(
  "name LIKE ? OR employee_id LIKE ? OR department LIKE ? OR designation LIKE ? OR email LIKE ?",
  search_term,
  search_term,
  search_term,
  search_term,
  search_term
)

    else

      @employees = Employee.all

    end

  end



  def new

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end


    @employee = Employee.new

  end




  def create

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end


    @employee = Employee.new(employee_params)


    if @employee.save

      redirect_to employees_path,
                  notice: "Employee added successfully"

    else

      render :new

    end

  end




  def edit

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end


    @employee = Employee.find(params[:id])

  end





  def update

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end


    @employee = Employee.find(params[:id])


    if @employee.update(employee_params)

      redirect_to employees_path,
                  notice: "Employee updated successfully"

    else

      render :edit

    end

  end





  def destroy

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end


    @employee = Employee.find(params[:id])

    @employee.destroy


    redirect_to employees_path,
                notice: "Employee deleted successfully"

  end





  private



  def require_admin_login

    unless session[:admin_logged_in]

      redirect_to admin_login_path

    end

  end




  def employee_logged_in?

    session[:employee_id].present?

  end




  def employee_params

    params.require(:employee).permit(
      :name,
      :employee_id,
      :department,
      :designation,
      :email,
      :password,
      :joining_date
    )

end



end
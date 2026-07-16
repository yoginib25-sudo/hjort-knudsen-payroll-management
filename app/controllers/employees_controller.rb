class EmployeesController < ApplicationController
 def index
  if params[:search].present?
    search_term = "%#{params[:search]}%"

    @employees = Employee.where(
      "name LIKE ? OR employee_id LIKE ? OR department LIKE ? OR email LIKE ?",
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
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_index_path
    else
      render :new
    end
  end

  def edit
  @employee = Employee.find(params[:id])
end

def update
  @employee = Employee.find(params[:id])

  if @employee.update(employee_params)
    redirect_to employees_path
  else
    render :edit
  end
end

def destroy
  @employee = Employee.find(params[:id])
  @employee.destroy

  redirect_to employees_path
end

  private

  def employee_params
    params.require(:employee).permit(:name, :employee_id, :department, :email)
  end
end
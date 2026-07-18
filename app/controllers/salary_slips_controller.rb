class SalarySlipsController < ApplicationController

  before_action :require_admin_login, except: [:show]


  def index

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end

    @salary_slips = SalarySlip.all

  end



  def new

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end

    @salary_slip = SalarySlip.new

  end




  def create

    if employee_logged_in?
      redirect_to employee_dashboard_path
      return
    end


    @salary_slip = SalarySlip.new(salary_slip_params)


    if @salary_slip.save

      redirect_to salary_slips_path,
                  notice: "Salary slip created successfully"

    else

      render :new

    end

  end





  def show

    @salary_slip = SalarySlip.find(params[:id])


    if employee_logged_in?


      employee = Employee.find_by(id: session[:employee_id])


      unless employee && @salary_slip.employee_id == employee.id

        redirect_to employee_dashboard_path,
                    alert: "You are not authorized to view this salary slip."

        return

      end



    elsif !session[:admin_logged_in]


      redirect_to admin_login_path

      return


    end


  end





  def edit

    if employee_logged_in?

      redirect_to employee_dashboard_path

      return

    end


    @salary_slip = SalarySlip.find(params[:id])

  end





  def update


    if employee_logged_in?

      redirect_to employee_dashboard_path

      return

    end


    @salary_slip = SalarySlip.find(params[:id])


    if @salary_slip.update(salary_slip_params)


      redirect_to salary_slip_path(@salary_slip),
                  notice: "Salary slip updated successfully"


    else


      render :edit


    end


  end





  def destroy


    if employee_logged_in?

      redirect_to employee_dashboard_path

      return

    end


    @salary_slip = SalarySlip.find(params[:id])

    @salary_slip.destroy


    redirect_to salary_slips_path,
                notice: "Salary slip deleted successfully"


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





  def salary_slip_params

    params.require(:salary_slip).permit(

      :employee_id,
      :month,
      :year,

      :basic_salary,

      :hra,
      :transport_allowance,
      :medical_allowance,
      :special_allowance,
      :other_allowances,

      :gross_salary,

      :pf,
      :professional_tax,
      :tds,
      :loan_deduction,
      :other_deductions,

      :allowances,
      :deductions,
      :net_salary

    )

  end


end
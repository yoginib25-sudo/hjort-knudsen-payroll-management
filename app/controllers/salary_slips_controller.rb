class SalarySlipsController < ApplicationController
  def index
    @salary_slips = SalarySlip.all
  end

  def new
    @salary_slip = SalarySlip.new
  end

  def create
    @salary_slip = SalarySlip.new(salary_slip_params)

    if @salary_slip.save
      redirect_to salary_slips_path
    else
      render :new
    end
  end

  def show
  @salary_slip = SalarySlip.find(params[:id])
  end

  def edit
  @salary_slip = SalarySlip.find(params[:id])
end

def update
  @salary_slip = SalarySlip.find(params[:id])

  if @salary_slip.update(salary_slip_params)
    redirect_to salary_slip_path(@salary_slip)
  else
    render :edit
  end
end

def destroy
  @salary_slip = SalarySlip.find(params[:id])
  @salary_slip.destroy

  redirect_to salary_slips_path
end

  private

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
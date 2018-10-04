# frozen_string_literal: true

# employee controller
class EmployeesController < ApplicationController
  before_action :find_employee, only: [:edit, :update, :destroy, :show]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(delivery_boy_params)
    password = SecureRandom.hex(8)
    @employee.password = password
    if @employee.save
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def index
    @employees = Employee.all
  end

  def edit; end

  def update
    if @employee.update(delivery_boy_params)
      redirect_to employee_path(@employee)
    else
      render 'edit'
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def show; end

  private

  def find_employee
    @employee = Employee.find(params[:id]) rescue nil
  end

  def delivery_boy_params
    params.require(:employee).permit(:first_name, :last_name,
                                     :username, :primary_technology, :secondary_technology, :email)
  end
end

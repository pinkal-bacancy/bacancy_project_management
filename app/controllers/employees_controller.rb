# frozen_string_literal: true

# employee controller
class EmployeesController < ApplicationController
  before_action :find_employee, only: %i[edit update destroy show change_role]
  before_action :breadcrumb_path, only: %i[new show]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    password = SecureRandom.hex(8) #logic for autho generate pass
    @employee.password = password
    if @employee.save
      # EmployeeMailer.employee_send_password_email(@employee).deliver_now
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def index
    @filterrific = initialize_filterrific(
      Employee,
      params[:filterrific]
    ) or return
    @employees = @filterrific.find.page(params[:page])
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Employees', employees_path
   # @employees = Employee.all
    @roles = Role.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit; end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render 'edit'
    end
  end

  def change_role
    @roles = Role.all
    @employee&.roles&.delete_all
    @employee&.add_role params[:role]
    @employees = Employee.page(params[:page])
  end

  # def unique_employee
  #   @employee_email = Employee.find_by(email: params[:email])
  #   @employee_username = Employee.find_by(username: params[:username])
  # end

  def unique_username
    @employee_email = Employee.find_by(email: params[:email])
    @employee_username = Employee.find_by(username: params[:username])
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def show
  end

  private

  def breadcrumb_path
    add_breadcrumb "Home", root_path
    add_breadcrumb "Employees", employees_path, :title => "Back to the Index"
    add_breadcrumb "Add Employee", new_employee_path, :title => "Back to the Index"
  end

  def find_employee
    @employee = Employee.find(params[:id]) rescue nil
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name,
                                     :username, :technology_id,
                                     :secondary_technology, :email, :is_primary)
  end
end

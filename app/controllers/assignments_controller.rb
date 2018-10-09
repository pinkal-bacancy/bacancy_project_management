# frozen_string_literal: true

# assignment controller
class AssignmentsController < ApplicationController
  before_action :find_assignment, only: %i[edit update destroy show]
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      params[:assignment][:employee_ids].each do |employee|
        @employee = Employee.find(employee) rescue nil
        @assignment.employees << @employee if @employee.present?
      end
      redirect_to assignments_path
    else
      render 'new'
    end
  end

  def index
    @assignments = Assignment.all
  end

  def edit; end

  def update
    if @assignment.update(assignment_params)
      # delete all employees and then add
      @assignment&.employees.delete_all
      params[:assignment][:employee_ids].each do |employee|
        @employee = Employee.find(employee) rescue nil
        @assignment.employees << @employee if @employee.present?
      end
      redirect_to assignments_path
    else
      render 'edit'
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_path
  end

  def show; end

  private

  def find_assignment
    @assignment = Assignment.find(params[:id]) rescue nil
  end

  def assignment_params
    params.require(:assignment).permit(:start_date, :end_date, :project_id)
  end
end

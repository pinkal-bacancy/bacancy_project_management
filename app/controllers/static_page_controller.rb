# frozen_string_literal: true

# static page controller
class StaticPageController < ApplicationController
	before_action :authenticate_employee!
  def index
  	@project_list = Project.all.order(:created_at)
  	@top_budget_project = Project.all.order(:price)
  end

  def dedicated_employees
    render json: Employee.where(is_primary: true).count
  end

  def profile
  	@employee = current_employee
  end
end

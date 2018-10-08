# frozen_string_literal: true

module ApplicationHelper
	def find_employee(project)
		@employee = Employee.find(project.employee_id) rescue nil
		@employee&.username 
	end

	def total_emp_count
		@employees = Employee.count
	end

	def total_technology_count
		@technologies = Technology.count
	end

	def total_project_count
		@projects = Project.count
	end
end

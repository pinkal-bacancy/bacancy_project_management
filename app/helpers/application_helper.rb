# frozen_string_literal: true

module ApplicationHelper
	def find_employee(project)
		@employee = Employee.find(project.employee_id) rescue nil
		@employee&.username 
	end
end

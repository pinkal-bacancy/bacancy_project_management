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

	def employee_with_role_pm
		@pm = []
		Employee.all.each do |employee|
			@pm << employee if employee.has_role? "PM"
    end
    return @pm
  end
  
	def employee_with_role
		@pm = []
		Employee.all.each do |employee|
			@pm << employee unless employee.has_role? "PM"
		end
		return @pm
	end

	def find_employee_more_than_one_project
		employee_with_role
		@emp = []
 		@pm.each do |e|
    	@emp << e if e.assignments.count > 1
 		end
 		return @emp
	end

	def find_project(assignment)
		Project.find(assignment.project_id).project_name
	end

end

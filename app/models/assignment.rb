# frozen_string_literal: true

# assignment model
class Assignment < ApplicationRecord
  # belongs_to :employee
  belongs_to :project
  has_many :assignment_employees
  has_many :employees, through: :assignment_employees
  filterrific(
   available_filters: [
     :search_by_employee,
     :search_assignment_by_technology,
     :search_assignment_by_client
   ]
 )

  assignment_list = []
  scope :search_by_employee, -> (employee) { joins(:assignments_employees).where(:assignments_employees => {:employee_id => employee})}
  #scope :search_assignment_by_technology, -> (technology) {}
  def self.search_assignment_by_technology(technology_id)
    Assignment.where(project_id: (Technology.find(technology_id).projects.pluck(:id)))  
    # Assignment.joins("INNER JOIN projects ON projects.id = assignments.project_id INNER JOIN projects_technologies ON projects.id = projects_technologies.project_id").where("projects_technologies.technology_id = ?", technology_id)

  end

  def self.search_assignment_by_client(client_id)
    Assignment.where(project_id: (Client.find(client_id).projects.pluck(:id)))
    # Assignment.joins("INNER JOIN projects ON projects.id = assignments.project_id INNER JOIN clients ON projects.client_id = clients.id").where("clients.id = ?", client_id)
  end
end

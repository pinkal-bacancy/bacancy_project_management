# frozen_string_literal: true

# employee model
class Project < ApplicationRecord
  has_many :assignments
  has_many :employees
  has_and_belongs_to_many :technologies
  belongs_to :client
  filterrific(
   available_filters: [
     :search_by_pm,
     :with_technology,
     :with_client
   ]
 )
  scope :search_by_pm, -> (pm) { where(employee_id: pm)}
  scope :with_technology, -> (technology) { joins(:projects_technologies).where(:projects_technologies => {:technology_id => technology})}
  scope :with_client, -> (client) { where(client_id: client)}
end

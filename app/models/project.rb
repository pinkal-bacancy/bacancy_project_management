# frozen_string_literal: true

# employee model
class Project < ApplicationRecord
  has_one :assignments
  has_many :employees
  accepts_nested_attributes_for :assignments_employees
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

  composed_of :price,
              :class_name => 'Money',
              :mapping => %w(price cents),
              :converter => Proc.new { |value| Money.new(value, "INR") }
end

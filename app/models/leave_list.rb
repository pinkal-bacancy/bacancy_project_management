class LeaveList < ApplicationRecord
  belongs_to :employee
  belongs_to :project

  filterrific(
   available_filters: [
     :search_by_employee,
   ]
 )
  scope :search_by_employee, -> (employee_id) { where(employee_id: employee_id)}
end

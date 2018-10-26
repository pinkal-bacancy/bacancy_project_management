class DropAssignmentsEmployeesTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :assignments_employees
  end
end

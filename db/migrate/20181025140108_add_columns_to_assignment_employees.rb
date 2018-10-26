class AddColumnsToAssignmentEmployees < ActiveRecord::Migration[5.2]
  def change
  	add_column :assignment_employees, :start_date, :date
  	add_column :assignment_employees, :end_date, :date
  	add_reference :assignment_employees, :projects, foreign_key: true
  	remove_column :assignment_employees, :assignment_id
  end
end

class CreateJoinTableAssignmentEmployee < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :assignments, :employees do |t|
      # t.index [:assignment_id, :employee_id]
      # t.index [:employee_id, :assignment_id]
    end
  end
end

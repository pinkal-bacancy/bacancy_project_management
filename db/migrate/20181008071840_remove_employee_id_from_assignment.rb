class RemoveEmployeeIdFromAssignment < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :assignments, :employee, index: true
  end
end

class RemoveEmployeeAndTechnologyFromProject < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :employee, index: true
    remove_reference :projects, :technology, index: true
  end
end

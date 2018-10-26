class CreateAssignmentEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :assignment_employees do |t|
      t.boolean :is_dedicated
      t.belongs_to :assignment, index: true
      t.belongs_to :employees, index: true
      t.timestamps
    end
  end
end

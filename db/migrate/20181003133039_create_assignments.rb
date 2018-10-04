class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.date :start_date
      t.date :end_date
      t.references :employee, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :is_primary

      t.timestamps
    end
  end
end

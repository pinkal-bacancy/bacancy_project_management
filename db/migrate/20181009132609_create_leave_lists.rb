class CreateLeaveLists < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_lists do |t|
      t.references :employee, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end

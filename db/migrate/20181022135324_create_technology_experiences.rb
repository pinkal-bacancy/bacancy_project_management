class CreateTechnologyExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :technology_experiences do |t|
      t.references :employee, foreign_key: true
      t.references :technology, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

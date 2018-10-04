# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :technologies, array: true, default: []
      t.date :start_date
      t.date :end_date
      t.string :rough_order_magnitude
      t.references :employee
      t.references :client

      t.timestamps
    end
  end
end

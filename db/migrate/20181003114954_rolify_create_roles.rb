# frozen_string_literal: true

class RolifyCreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, polymorphic: true

      t.timestamps
    end

    create_table(:employees_roles, id: false) do |t|
      t.references :employee
      t.references :role
    end

    add_index(:roles, %i[name resource_type resource_id])
    add_index(:employees_roles, %i[employee_id role_id])
  end
end

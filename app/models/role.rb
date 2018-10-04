# frozen_string_literal: true

# role model
class Role < ApplicationRecord
  has_and_belongs_to_many :employees, join_table: :employees_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end

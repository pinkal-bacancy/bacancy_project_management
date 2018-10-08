# frozen_string_literal: true

# assignment model
class Assignment < ApplicationRecord
  # belongs_to :employee
  belongs_to :project
  has_and_belongs_to_many :employees
end

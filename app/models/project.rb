# frozen_string_literal: true

# employee model
class Project < ApplicationRecord
  has_many :assignments
  has_many :employees, through: :assignments
  has_and_belongs_to_many :technologies
  belongs_to :client
end

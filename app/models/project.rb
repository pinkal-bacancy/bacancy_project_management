# frozen_string_literal: true

# employee model
class Project < ApplicationRecord
  has_many :assignments
  has_many :employees, through: :assignments
  has_and_belongs_to_many :technologies
  belongs_to :client

  composed_of :price,
              :class_name => 'Money',
              :mapping => %w(price cents),
              :converter => Proc.new { |value| Money.new(value, "INR") }
end

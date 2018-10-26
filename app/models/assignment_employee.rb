class AssignmentEmployee < ApplicationRecord
	belongs_to :assignments
	belongs_to :employees
end

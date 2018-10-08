# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
technologies = ['ROR', 'Node JS', 'React JS', 'PHP', 'iOS', 'Android', 'GOlang', 'React Native', 'Vue JS', '.NET', 'Angular JS']

technologies.each do |technology|
	@technology1 = Technology.find_or_create_by(name: technology)
end
ROLES=["Admin","PM","Sales & Marketing"]
ROLES.each do |role|
	Role.find_or_create_by(name: role)
end
# frozen_string_literal: true

# employee model
class Employee < ApplicationRecord
  has_many :projects
  has_many :assignment_employees
  has_many :assignments, through: :assignment_employees
  belongs_to :technology
  has_many :technology_experiences
  accepts_nested_attributes_for :technology_experiences
  filterrific(
   available_filters: [
     :search_by_email,
     #:search_by_role,
     :with_primary_technology
   ]
 )
  scope :search_by_email, -> (email) { where("email like ?", "#{email}%")}
  scope :with_primary_technology, -> (primary_technology) { where(technology_id: primary_technology)}
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
 

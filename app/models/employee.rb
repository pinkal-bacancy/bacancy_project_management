# frozen_string_literal: true

# employee model
class Employee < ApplicationRecord
  # has_many :assignments
  has_many :projects
  has_and_belongs_to_many :assignments
  belongs_to :technology
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
 

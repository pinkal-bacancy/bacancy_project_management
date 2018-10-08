# frozen_string_literal: true

# employee model
class Employee < ApplicationRecord
  # has_many :assignments
  has_many :projects, through: :assignments
  has_and_belongs_to_many :assignments
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

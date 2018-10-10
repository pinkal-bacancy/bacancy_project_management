# frozen_string_literal: true

# client model
class Client < ApplicationRecord
	has_many :projects
	filterrific(
   available_filters: [
     :search_by_client_email,
     :search_by_country,
   ]
 	)
  scope :search_by_client_email, -> (email) { where("client_email like ?", "#{email}%")}
  scope :search_by_country, -> (country) { where(country: country)}
end

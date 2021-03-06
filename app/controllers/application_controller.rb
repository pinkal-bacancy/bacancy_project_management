# frozen_string_literal: true
class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	# method for adding additional attributes to devise model
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username technology_id secondary_technology])
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :add_parameters_to_user, if: :devise_controller?

  protected

  def add_parameters_to_user
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end

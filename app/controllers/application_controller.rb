class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  # the following method is to redirect the user after signin
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:sign_up) << :address
    devise_parameter_sanitizer.for(:sign_up) << :latitude
    devise_parameter_sanitizer.for(:sign_up) << :longitude
    devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:account_update) << :phone
    devise_parameter_sanitizer.for(:account_update) << :address
    devise_parameter_sanitizer.for(:account_update) << :latitude
    devise_parameter_sanitizer.for(:account_update) << :longitude
  end


end

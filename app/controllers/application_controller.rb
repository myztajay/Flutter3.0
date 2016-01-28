class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #call the page for devise pages
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  # protects DB from being written to
  protected 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remmeber_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, :remmeber_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :email, :password, :password_confirmation, :remmeber_me) }
  end
end
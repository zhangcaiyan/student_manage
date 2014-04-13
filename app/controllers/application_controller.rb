class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)

    if resource.admin?
      admin_home_url
    elsif resource.student?
      student_home_url
    elsif resource.xuegongchu?
      xuegongchu_home_url
    else
      home_url
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :username, :password, :password_confirmation) }
  end

end

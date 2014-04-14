class Student::BaseController < ApplicationController

  layout "admin"
  before_action :authenticate_student!, :check_person_info
  helper_method :current_person_info


  protected

  def authenticate_student!
    if !user_signed_in? || !current_user.student?
      redirect_to home_path
    end
  end

  def check_person_info
    if current_person_info.nil?
      redirect_to new_student_person_info_path
    end
  end

  def current_person_info
    @current_person_info ||= current_user.try(:person_info)
  end

end

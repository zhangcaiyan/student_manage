class Student::BaseController < ApplicationController

  layout "admin"
  before_action :authenticate_student!


  protected

  def authenticate_student!
    if !user_signed_in? || !current_user.student?
      redirect_to home_path
    end
  end

end

class Admin::BaseController < ApplicationController

  # layout "admin"
  before_action :authenticate_admin!


  protected

  def authenticate_admin!
    if !user_signed_in? || !current_user.admin?
        redirect_to home_path
    end
  end

end

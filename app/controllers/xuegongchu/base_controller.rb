class Xuegongchu::BaseController < ApplicationController

  layout "admin"
  before_action :authenticate_xuegongchu!


  protected

  def authenticate_xuegongchu!
    if !user_signed_in? || !current_user.xuegongchu?
      redirect_to home_path
    end
  end




end

class HomeController < ApplicationController
  def index
    @reward_applications = RewardApplication.where(state: "已通过").page(params[:page]).per_page(10)
  end
end

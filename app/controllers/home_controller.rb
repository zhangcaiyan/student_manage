class HomeController < ApplicationController
  def index
    @reward_applications = RewardApplication.where(state: ["已通过", "已拒绝", "已审批"]).page(params[:page]).per_page(10)
  end
end

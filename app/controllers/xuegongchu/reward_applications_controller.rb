class Xuegongchu::RewardApplicationsController < Xuegongchu::BaseController

  def index
    @search = RewardApplication.where("state != ?", "未上报").search(params[:search])
    @reward_applications = @search.result.page(params[:page]).per_page(30)
  end

  def show
    @reward_application = RewardApplication.find(params[:id])
    @student_scores = @reward_application.user.scores.page(params[:page]).per_page(10)
  end

  def change
    @reward_application = RewardApplication.find(params[:id])
    @reward_application.send(params[:shijian].to_sym)
    redirect_to xuegongchu_reward_applications_url
  end


end

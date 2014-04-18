class Xuegongchu::HomeController < Xuegongchu::BaseController
  def index
    @current_date_reward_applications = RewardApplication.search(created_at_gte: Date.current, state_eq: "已上报").result
  end
end

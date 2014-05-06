class Student::RewardApplicationsController < Student::BaseController
  prepend_before_action :set_reward_application, only: [:show, :edit, :update, :destroy, :change]
  before_action :verify_edit_reward_application, only: :edit
  before_action :verify_application_date, only: :change


  def index
    @reward_applications = current_user.reward_applications.page(params[:page]).per_page(10)
    @yishangbao_reward_application = current_user.reward_applications.with_state(:yishangbao).first
  end

  def show
  end

  def new
    @reward_application = current_user.reward_applications.new
  end

  def edit
  end

  def create
    @reward_application = current_user.reward_applications.new(reward_application_params)

    respond_to do |format|
      if @reward_application.save
        format.html { redirect_to student_reward_applications_url, notice: '评优奖励申请开始' }
        format.json { render action: 'show', status: :created, location: @reward_application }
      else
        format.html { render action: 'new' }
        format.json { render json: @reward_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reward_application.update(reward_application_params)
        format.html { redirect_to student_reward_applications_url, notice: '评优奖励更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reward_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reward_application.destroy
    respond_to do |format|
      format.html { redirect_to student_reward_applications_url }
      format.json { head :no_content }
    end
  end

  def change
    @reward_application.send(params[:shijian].to_sym)
    redirect_to student_reward_applications_url
  end

  def other
    @reward_applications = RewardApplication.where(state: ["已审批"]).page(params[:page]).per_page(10).order("created_at DESC")
  end

  def toupiao
    @reward_application = RewardApplication.find(params[:id])
    current_user.toupiao(@reward_application)
    render json: {status: true}.to_json
  end

  private

    def verify_edit_reward_application
      if !(@reward_application.weishangbao? || @reward_application.yishangbao?)
        redirect_to student_reward_applications_url, notice: "#{@reward_application.state}的申请不可以编辑"
      end
    end

    def verify_application_date
      application_date = ApplicationDate.first
      if application_date.blank? || Date.current < application_date.start_at || Date.current > application_date.end_at
        redirect_to student_home_path, notice: "评优奖励申请时间阶段尚未创建 或者 您不在该时间阶段内"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reward_application
      @reward_application = current_user.reward_applications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_application_params
      params.require(:reward_application).permit(:application_id, :phone, :xueyuan_id, :content, :rongyu, :user_id)
    end
end

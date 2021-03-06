class RewardApplication < ActiveRecord::Base

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :application, class_name: :Application
  belongs_to :xueyuan, class_name: :Xueyuan

  has_many :user_reward_applications, dependent: :destroy
  has_many :users, through: :user_reward_applications

  validates_presence_of :application_id, :phone, :xueyuan_id, :content, :rongyu, :user_id, :state
  validate :verify_state

  state_machine initial: :weishangbao do
    event :shangbao do
      transition :weishangbao => :yishangbao
    end

    event :chehui do
      transition :yishangbao => :weishangbao
      transition :yishengpi => :weishangbao
    end

    event :shenpi do
      transition :yishangbao => :yishengpi
    end

    event :tongguo do
      transition :yishengpi => :yitongguo
    end

    event :jujue do
      transition :yishengpi => :yijujue
    end


    state :weishangbao, value: "未上报"
    state :yishangbao, value: "已上报"
    state :yishengpi, value: "已审批"
    state :yijujue, value: "已拒绝"
    state :yitongguo, value: "已通过"
  end

  def self.get_event_text_by(event)
    {"shangbao" => "上报", "chehui" => "撤回", "shenpi" => "审批", "tongguo" => "通过", "jujue" => "拒绝"}[event.to_s]
  end


  protected

  def verify_state
    yishangbao_reward_application = user.reward_applications.with_state(:yishangbao)
    errors.add(:base, "您已经上报了一份评优申请") if yishangbao_reward_application.present? && yishangbao?
  end

  # def verify_event
  #   errors.add(:base, "无权限此操作") if user.student? && (yishengpi? || yitongguo? || yijujue?)
  # end

end

# 上报  审批、撤回、决绝
# 新填写未上报 已上报 已审批  已拒绝

# 上报后的申请单不允许进行修改、删除
# 报后的申请单不能够进行修改和删除操作
# 撤回操作会将申请单的状态从“已上报”还原为“新填写未上报”
# 上报后的申请单如果未经审批,在申请阶段可以撤回

#问题：
#拒绝的申请，学生不能继续申请

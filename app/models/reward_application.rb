class RewardApplication < ActiveRecord::Base

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :application, class_name: "Dict::Application"
  belongs_to :xueyuan, class_name: "Dict::Xueyuan"

  validates_presence_of :application_id, :phone, :xueyuan_id, :content, :rongyu, :user_id, :state

  state_machine initial: :weishangbao do
    event :shangbao do
      transition :weishangbao => :yishangbao
    end

    event :chehui do
      transition :yishangbao => :weishangbao
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

end

# 上报  审批、撤回、决绝
# 新填写未上报 已上报 已审批  已拒绝

# 上报后的申请单不允许进行修改
# 报后的申请单不能够进行修改和删除操作
# 撤回操作会将申请单的状态从“已上报”还原为“新填写未上报”
# 上报后的申请单如果未经审批,在申请阶段可以撤回

#问题：
#拒绝的申请，学生能否继续申请
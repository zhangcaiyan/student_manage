class RewardApplication < ActiveRecord::Base

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :application, class_name: "Dict::Application"
  belongs_to :xueyuan, class_name: "Dict::Xueyuan"

  validates_presence_of :application_id, :phone, :xueyuan_id, :content, :rongyu, :user_id


end

class UserRewardApplication < ActiveRecord::Base

  validates_presence_of :user_id, :reward_application_id
  belongs_to :user
  belongs_to :reward_application

  validates :reward_application_id, uniqueness: {scope: :user_id}
end

class CreateUserRewardApplications < ActiveRecord::Migration
  def change
    create_table :user_reward_applications do |t|
      t.integer :user_id
      t.integer :reward_application_id

      t.timestamps
    end
  end
end

class CreateRewardApplications < ActiveRecord::Migration
  def change
    create_table :reward_applications do |t|
      t.integer :application_id
      t.string :phone
      t.integer :xueyuan_id
      t.text :content
      t.text :rongyu
      t.integer :user_id

      t.timestamps
    end
  end
end

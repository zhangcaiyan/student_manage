class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :category_id
      t.integer :xueqi_id
      t.integer :subject_id
      t.integer :score_id
      t.integer :user_id

      t.timestamps
    end
  end
end

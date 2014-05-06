class AddColumnXuenianIdAndScores < ActiveRecord::Migration
  def change
    add_column :scores, :xuenian_id, :integer

    Score.update_all(xuenian_id: 4)

    Score.where(xueqi_id: nil).update_all(xueqi_id: 1)
  end
end

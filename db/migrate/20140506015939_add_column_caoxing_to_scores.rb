class AddColumnCaoxingToScores < ActiveRecord::Migration
  def change
    add_column :scores, :caoxing, :integer
    add_column :scores, :pingjun_score, :integer
  end
end

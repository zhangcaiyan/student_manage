class AddColumnZhuanyeIdToPersonInfos < ActiveRecord::Migration
  def change
    add_column :person_infos, :zhuanye_id, :integer
  end
end

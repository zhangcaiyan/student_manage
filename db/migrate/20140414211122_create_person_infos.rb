class CreatePersonInfos < ActiveRecord::Migration
  def change
    create_table :person_infos do |t|
      t.string :name
      t.integer :gender_id
      t.string :xuehao
      t.string :zhuanye
      t.string :zhiwu
      t.string :minzu
      t.integer :political_id
      t.integer :score_id
      t.integer :user_id

      t.timestamps
    end
  end
end

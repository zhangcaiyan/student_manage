class CreateZhuanyes < ActiveRecord::Migration
  def change
    create_table :zhuanyes do |t|
      t.string :name
      t.integer :xueyuan_id

      t.timestamps
    end
  end
end

class CreateXueyuans < ActiveRecord::Migration
  def change
    create_table :xueyuans do |t|
      t.string :name

      t.timestamps
    end
  end
end

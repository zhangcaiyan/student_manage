class CreateApplicationDates < ActiveRecord::Migration
  def change
    create_table :application_dates do |t|
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end

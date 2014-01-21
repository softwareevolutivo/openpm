class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.text :work_description, null: false
      t.text :notes
      t.integer :hours, null: false
      t.decimal :hour_rate, precision: 5, scale: 2, null: false

      t.timestamps
    end
  end
end

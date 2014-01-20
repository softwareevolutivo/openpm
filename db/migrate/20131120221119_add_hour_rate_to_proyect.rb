class AddHourRateToProyect < ActiveRecord::Migration
  def change
    add_column :projects, :hour_rate, :decimal
  end
end

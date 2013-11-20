class AddHourRateToProyect < ActiveRecord::Migration
  def change
    add_column :proyects, :hour_rate, :decimal
  end
end

class AddHourValueToProyect < ActiveRecord::Migration
  def change
    add_column :projects, :hour_value, :decimal
  end
end

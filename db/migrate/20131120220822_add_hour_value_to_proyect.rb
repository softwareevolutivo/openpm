class AddHourValueToProyect < ActiveRecord::Migration
  def change
    add_column :proyects, :hour_value, :decimal
  end
end

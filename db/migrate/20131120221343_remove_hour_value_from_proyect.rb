class RemoveHourValueFromProyect < ActiveRecord::Migration
  def change
    remove_column :proyects, :hour_value, :string
  end
end

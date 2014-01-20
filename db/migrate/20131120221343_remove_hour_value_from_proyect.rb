class RemoveHourValueFromProyect < ActiveRecord::Migration
  def change
    remove_column :projects, :hour_value, :string
  end
end

class AddValueToProyect < ActiveRecord::Migration
  def change
    add_column :projects, :value, :decimal
  end
end

class AddValueToProyect < ActiveRecord::Migration
  def change
    add_column :proyects, :value, :decimal
  end
end

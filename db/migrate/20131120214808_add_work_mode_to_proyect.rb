class AddWorkModeToProyect < ActiveRecord::Migration
  def change
    add_column :proyects, :work_mode, :string
    change_column_null :proyects, :customer_id, false
  end
end

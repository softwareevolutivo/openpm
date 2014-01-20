class AddWorkModeToProyect < ActiveRecord::Migration
  def change
    add_column :projects, :work_mode, :string
    change_column_null :projects, :customer_id, false
  end
end

class AddEmployeeRefToProjectWorker < ActiveRecord::Migration
  def change
    add_reference :project_workers, :employee, index: true
  end
end

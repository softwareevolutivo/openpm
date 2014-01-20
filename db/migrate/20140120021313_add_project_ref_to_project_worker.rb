class AddProjectRefToProjectWorker < ActiveRecord::Migration
  def change
    add_reference :project_workers, :project, index: true
  end
end

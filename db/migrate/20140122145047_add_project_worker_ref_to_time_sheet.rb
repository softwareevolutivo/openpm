class AddProjectWorkerRefToTimeSheet < ActiveRecord::Migration
  def change
    remove_reference :time_sheets, :project_worker
    add_reference :time_sheets, :project_worker, index: true
  end
end

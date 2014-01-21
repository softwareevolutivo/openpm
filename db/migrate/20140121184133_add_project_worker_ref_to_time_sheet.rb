class AddProjectWorkerRefToTimeSheet < ActiveRecord::Migration
  def change
    add_reference :time_sheets, :project_worker, index: true
  end
end

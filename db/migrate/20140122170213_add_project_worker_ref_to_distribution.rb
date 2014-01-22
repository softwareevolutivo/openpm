class AddProjectWorkerRefToDistribution < ActiveRecord::Migration
  def change
    add_reference :distributions, :project_worker, index: true
  end
end

class CreateProjectWorkers < ActiveRecord::Migration
  def change
    create_table :project_workers do |t|
      t.string :role
      t.decimal :hour_rate, precision: 5, scale: 2

      t.timestamps
    end
  end
end

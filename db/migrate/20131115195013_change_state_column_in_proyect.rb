class ChangeStateColumnInProyect < ActiveRecord::Migration
  def change
    change_column_default :proyects, :state, 'proposal'
    change_column_null :projects, :state, false
  end
end

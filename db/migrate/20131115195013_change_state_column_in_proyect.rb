class ChangeStateColumnInProyect < ActiveRecord::Migration
  def change
    change_column_default :proyects, :state, 'proposal'
    change_column_null :proyects, :state, false
  end
end

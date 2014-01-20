class ChangeStateColumnInProject < ActiveRecord::Migration
  def change
    change_column_default :projects, :state, 'proposal'
    change_column_null :projects, :state, false
  end
end

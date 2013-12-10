class ChangeCustomerColumnInProyect < ActiveRecord::Migration
  def change
    change_column_null :projects, :id_customer, false
  end
end

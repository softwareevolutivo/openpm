class ChangeCustomerColumnInProyect < ActiveRecord::Migration
  def change
    change_column_null :proyects, :id_customer, false
  end
end

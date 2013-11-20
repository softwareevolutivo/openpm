class ChangeCustomerColumnInProyect2 < ActiveRecord::Migration
  def change
    change_column_null :proyects, :customer_id, false, 'by_hours'
  end
end

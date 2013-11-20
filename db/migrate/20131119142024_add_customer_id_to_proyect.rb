class AddCustomerIdToProyect < ActiveRecord::Migration
  def change
    add_column :proyects, :customer_id, :integer
    add_index :proyects, :customer_id
  end
end

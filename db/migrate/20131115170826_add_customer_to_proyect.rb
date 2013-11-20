class AddCustomerToProyect < ActiveRecord::Migration
  def change
    add_column :proyects, :id_customer, :integer
    add_index :proyects, :id_customer
  end
end

class RemoveIdCustomerFromProyect < ActiveRecord::Migration
  def change
    remove_index :proyects, :id_customer
    remove_column :proyects, :id_customer, :integer
  end
end

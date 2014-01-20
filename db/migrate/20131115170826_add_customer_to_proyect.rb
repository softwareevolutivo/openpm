class AddCustomerToProject < ActiveRecord::Migration
  def change
    add_column :projects, :id_customer, :integer
    add_index :projects, :id_customer
  end
end

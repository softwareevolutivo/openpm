class RemoveIdCustomerFromProyect < ActiveRecord::Migration
  def change
    remove_index :projects, :id_customer
    remove_column :projects, :id_customer, :integer
  end
end

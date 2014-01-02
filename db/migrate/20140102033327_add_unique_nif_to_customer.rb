class AddUniqueNifToCustomer < ActiveRecord::Migration
  def change
    add_index :customers, :nif, :unique => true
  end
end

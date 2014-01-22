class AddProjectRefToPayment < ActiveRecord::Migration
  def change
    add_reference :payments, :project, index: true
  end
end

class AddPaymentRefToDistribution < ActiveRecord::Migration
  def change
    add_reference :distributions, :payment, index: true
  end
end

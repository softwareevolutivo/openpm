require 'spec_helper'

describe Customer do

  it 'should be get a customer ready' do
    Customer.create!(nif: @customer_date.nif, name: @customer_date.name)
    expect(Customer).to have(1).record
  end
end

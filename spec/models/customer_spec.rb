require 'spec_helper'

describe Customer do
  #pending "add some examples to (or delete) #{__FILE__}"

  it 'should be get a customer ready' do
    Customer.create!(nif: '9999999999999', name: 'SE Test Company')
    expect(Customer).to have(1).record
  end
end

require 'spec_helper'

describe Project do
  #pending "add some examples to (or delete) #{__FILE__}"

  it 'proyect with correct values must be created' do
    customer_se_test = Customer.create!(nif: '9999999999999', name: 'SE Test Company')
    proyect = Project.create!(name: 'Proyect Name', description: 'Proyect Description', customer: customer_se_test)
    expect(Project).to have(1).record
  end
end

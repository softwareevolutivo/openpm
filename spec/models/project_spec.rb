require 'spec_helper'

describe Project do
  #pending "add some examples to (or delete) #{__FILE__}"

  it 'should be create a valid project' do
    customer_se_test = Customer.create!(nif: '9999999999999', name: 'SE Test Company')
    proyect = Project.create!(
        name: 'Proyect Name',
        description: 'Proyect Description',
        customer: customer_se_test,
        work_mode: 'by_delivery',
        value: 4000.45
    )
    expect(Project).to have(1).record
  end
end

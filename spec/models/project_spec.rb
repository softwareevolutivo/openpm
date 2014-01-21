require 'spec_helper'

describe Project do
  #pending "add some examples to (or delete) #{__FILE__}"

  it 'should be create a valid project' do
    customer_se_test = Customer.create!(nif: @customer_date.nif, name: @customer_date.name)
    project = Project.create!(
        name: @project_data.name,
        description: @project_data.description,
        customer: customer_se_test,
        work_mode: @project_data.work_mode,
        value: @project_data.value
    )
    expect(Project).to have(1).record
  end
end

require 'spec_helper'

describe ProjectWorker do

  it 'should be able to  create an Project Worker' do
    customer_se_test = Customer.create!(nif: @customer_date.nif, name: @customer_date.name)
    project = Project.create!(
        name: @project_data.name,
        description: @project_data.description,
        customer: customer_se_test,
        work_mode: @project_data.work_mode,
        value: @project_data.value
    )
    employee = Employee.create!(
        email: @employee_fp_data.email,
        identification: @employee_fp_data.identification,
        name: @employee_fp_data.name,
        last_name: @employee_fp_data.last_name)
    project_worker = ProjectWorker.create!(
      role: 'seller',
      project: project,
      employee: employee
    )
    expect(ProjectWorker).to have(1).record
  end
end

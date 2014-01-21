require 'spec_helper'

describe Employee do

  it 'should create an employee properly' do
    employee = Employee.create!(
        email: @employee_fp_data.email,
        identification: @employee_fp_data.identification,
        name: @employee_fp_data.name,
        last_name: @employee_fp_data.last_name)
    expect(Employee).to have(1).record;
  end
end

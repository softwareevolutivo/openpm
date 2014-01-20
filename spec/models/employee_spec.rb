require 'spec_helper'

describe Employee do
  pending "add some examples to (or delete) #{__FILE__}"

  it 'should create an employee properly' do
    employee = Employee.create!(
        email: 'fernandopaz@softwareevolutivo.com.ec',
        identification: '1715309504',
        name: 'Fernando',
        last_name: 'Paz')
    expect(Employee).to have(1).record;
  end
end

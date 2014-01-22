require 'spec_helper'

describe Payment do
  it 'should be able to create a manually payment' do
    customer_se_test = Customer.create!(nif: @customer_date.nif, name: @customer_date.name)
    project = Project.create!(
        name: @project_data.name,
        description: @project_data.description,
        customer: customer_se_test,
        work_mode: @project_data.work_mode,
        value: @project_data.value
    )
    payment = Payment.create!(
        project: project,
        expiration_date: @payment_data.expiration_date,
        amount: @payment_data.amount,
        origin: @payment_data.origin,
        notes: @payment_data.notes
    )
    expect(Payment).to have(1).record
    expect(payment.distributable_amount).to eq(payment.amount*0.98)
    expect(payment.status).to eq('issued')
  end
end

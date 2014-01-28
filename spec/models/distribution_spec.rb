require 'spec_helper'

describe Distribution do
  it 'should be create a distribution for sale' do
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
    distribution = Distribution.create!(
        payment: payment,
        concept: 'sale'
    )
    expect(Distribution).to have(1).record
    expect(distribution.amount).to eq(payment.amount * (SALE_PERCENT / 100))
  end

  it 'should be create a distribution for capitalization' do
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
    distribution = Distribution.create!(
        payment: payment,
        concept: @distribution_data.concept
    )
    expect(Distribution).to have(1).record
    real_amount = payment.amount - (payment.amount * (SALE_PERCENT / 100))
    expect(distribution.amount).to eq(real_amount * (CAPITAL_PERCENT / 100))
  end
end

require 'spec_helper'

describe Distribution do
  before(:each) do
    customer_se_test = Customer.create!(nif: @customer_date.nif, name: @customer_date.name)
    project = Project.create!(
        name: @project_data.name,
        description: @project_data.description,
        customer: customer_se_test,
        work_mode: @project_data.work_mode,
        value: @project_data.value
    )
    @payment = Payment.create!(
        project: project,
        expiration_date: @payment_data.expiration_date,
        amount: @payment_data.amount,
        origin: @payment_data.origin,
        notes: @payment_data.notes
    )
  end

  it 'should be create a distribution for sale' do
    distribution = Distribution.create!(
        payment: @payment,
        concept: 'sale'
    )
    expect(Distribution).to have(1).record
    distribution_amount_expected = (@payment.amount * SALE_PERCENT) / 100
    #Rails.logger.debug "distribution_amount_expected -> #{distribution_amount_expected}"
    #Rails.logger.debug "distribution.amount -> #{distribution.amount}"
    expect(distribution.amount).to be == distribution_amount_expected
  end

  it 'should be create a distribution for capitalization' do
    distribution = Distribution.create!(
        payment: @payment,
        concept: 'capitalization'
    )
    expect(Distribution).to have(1).record
    distribution_amount_expected = (@payment.amount * CAPITAL_PERCENT) / 100
    #Rails.logger.debug "distribution_amount_expected -> #{distribution_amount_expected}"
    #Rails.logger.debug "distribution.amount -> #{distribution.amount}"
    expect(distribution.amount).to be == distribution_amount_expected
  end

  it 'should be create a distribution for accounting' do
    distribution = Distribution.create!(
        payment: @payment,
        concept: 'sale'
    )
    distribution = Distribution.create!(
        payment: @payment,
        concept: 'capitalization'
    )
    distribution = Distribution.create!(
        payment: @payment,
        concept: 'accounting'
    )
    expect(Distribution).to have(3).record
    distribution_sale_amount_expected = (@payment.amount * SALE_PERCENT) / 100
    distribution_capitalization_amount_expected = (@payment.amount * CAPITAL_PERCENT) / 100
    distribution_amount_expected = ((@payment.amount - distribution_sale_amount_expected - distribution_capitalization_amount_expected) * ACCOUTING_PERCENT) / 100
    #Rails.logger.debug "distribution_amount_expected -> #{distribution_amount_expected}"
    #Rails.logger.debug "distribution.amount -> #{distribution.amount}"
    expect(distribution.amount).to be == distribution_amount_expected
  end

  it 'should be create a distribution for execution' do
    distribution = Distribution.create!(
        payment: @payment,
        concept: 'sale'
    )
    distribution = Distribution.create!(
        payment: @payment,
        concept: 'capitalization'
    )
    distribution = Distribution.create!(
        payment: @payment,
        concept: 'execution'
    )
    expect(Distribution).to have(3).record
    distribution_sale_amount_expected = (@payment.amount * SALE_PERCENT) / 100
    distribution_capitalization_amount_expected = (@payment.amount * CAPITAL_PERCENT) / 100
    distribution_amount_expected = ((@payment.amount - distribution_sale_amount_expected - distribution_capitalization_amount_expected) * EXECUTION_PERCENT) / 100
    #Rails.logger.debug "distribution_amount_expected -> #{distribution_amount_expected}"
    #Rails.logger.debug "distribution.amount -> #{distribution.amount}"
    expect(distribution.amount).to be == distribution_amount_expected
  end
end

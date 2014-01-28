# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:each) do
    @customer_date = double(
        nif: '9999999999999',
        name: 'SE Test Company'
    )
    @project_data = double(
        'book',
        name: 'Project Name',
        description: 'Project Description',
        work_mode: 'by_delivery',
        value: 4000.45
    )
    @employee_xp_data = double(
        'employee_xp',
        email: 'ximenapaz@softwareevolutivo.com.ec',
        identification: '1715305566',
        name: 'Ximena',
        last_name: 'Paz'
    )
    @employee_fp_data = double(
        'employee_fp',
        email: 'fernandopaz@softwareevolutivo.com.ec',
        identification: '1715300001',
        name: 'Fernando',
        last_name: 'Paz'
    )
    @employee_ja_data = double(
        'employee_ja',
        email: 'jorgeaguilar@softwareevolutivo.com.ec',
        identification: '1715309900',
        name: 'Jorge',
        last_name: 'Aguilar'
    )
    @project_worker_data = double(
        'project_worker',
        role: 'seller'
    )
    @time_sheet = double(
        date: '02/01/2014'.to_date,
        start_time: '08:00'.to_time,
        end_time: '17:30'.to_time,
        work_description: 'TimeSheet design\nTimesheet TDD\n SSO conect with users',
        hours: 8.555
    )
    @payment_data =  double(
        'parment 1',
        expiration_date: '15/01/2014'.to_date,
        amount: 4895.22,
        origin: 'manual',
        notes: 'Notes of payments'
    )
    @distribution_data = double(
        concept: 'capitalization',
        amount: 501.22,
    )
  end
end

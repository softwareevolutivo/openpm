require 'spec_helper'

describe TimeSheet do
  it 'should be able to create an timesheet' do
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
        role: @project_worker_data.role,
        project: project,
        employee: employee
    )
    time_sheet = TimeSheet.create!(
        project_worker: project_worker,
        date: @time_sheet.date,
        start_time: @time_sheet.start_time,
        end_time: @time_sheet.end_time,
        work_description: @time_sheet.work_description,
        hours: @time_sheet.hours,
        hour_rate: project.hour_rate ? project.hour_rate : 0
    )
    expect(TimeSheet).to have(1).record
  end
end

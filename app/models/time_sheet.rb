class TimeSheet < ActiveRecord::Base
  belongs_to :project_worker

  validates :project_worker, :date, :start_time, :end_time, :work_description, presence: true
end

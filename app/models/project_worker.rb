class ProjectWorker < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee
  has_many :time_sheets

  validates :role, :project, :employee, presence: true
  validates_inclusion_of :role, in: %w( seller account_manager executor )
end

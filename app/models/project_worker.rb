class ProjectWorker < ActiveRecord::Base
  belongs_to :project
  belongs_to :employee

  validates :role, :project, :employee, presence: true
  validates_inclusion_of :role, in: %w( seller account_manager executor )
end

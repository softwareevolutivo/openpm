class Proyect < ActiveRecord::Base
  belongs_to :customer

  validates :customer, :name, :description, :work_mode, presence: true;
  validates_inclusion_of :state, in: %w( proposal contract started finish )
  validates_inclusion_of :work_mode, in: %w( by_hours by_delivery )
  validates_associated :customer
end

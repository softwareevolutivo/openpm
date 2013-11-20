class Proyect < ActiveRecord::Base
  belongs_to :customer

  validates :name, :description, presence: true;
  validates_inclusion_of :state, in: %w( proposal contract started finish )
  validates_associated :customer
end

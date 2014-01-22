class Project < ActiveRecord::Base
  belongs_to :customer
  has_many :project_workers
  has_many :payments

  validates :customer, :name, :description, :work_mode, presence: true;
  validates_inclusion_of :state, in: %w( proposal contract started finish )
  validates_inclusion_of :work_mode, in: %w( by_hours by_delivery )
  validates_associated :customer
  validates :hour_rate, presence: true, unless: :isByDelivery?
  validates :value, presence: true, if: :isByDelivery?
  validates :hour_rate, :format => { with: /\A?\d+(\.\d{2})?\Z/ }, :allow_blank => true
  validates :value, :format => { with: /\A?\d+(\.\d{2})?\Z/ }, :allow_blank => true

  def isByDelivery?
    logger.debug "work_mode => #{work_mode}"
    work_mode == 'by_delivery'
  end

end

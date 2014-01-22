class Payment < ActiveRecord::Base
  belongs_to :project
  has_many :distributions

  validates :project, :expiration_date, :distributable_amount, :amount, :status, :origin, presence: true;
  validates_inclusion_of :status, in: %w( issued cancelled )

  before_validation :calculate_distributable_amount

  private
  def calculate_distributable_amount
    self.distributable_amount = self.amount * 0.98
    unless self.status
      self.status = 'issued'
    end
  end
end

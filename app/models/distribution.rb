class Distribution < ActiveRecord::Base
  belongs_to :payment

  validates :concept, :status, :amount, presence: true
  validates_inclusion_of :concept, in: %w{ sale capitalization accounting execution }
  validates_inclusion_of :status, in: %w{ issued paid discarded }

  before_validation :complete_data

  private
  def complete_data
    unless self.status
      self.status = 'issued'
      case self.concept
        when 'sale'
          self.amount = self.payment.amount * (SALE_PERCENT / 100)
        when 'capitalization'
          self.amount = (self.payment.amount - (self.payment.amount * (SALE_PERCENT / 100))) * (CAPITAL_PERCENT / 100)
        when 'accounting'
          #self.amount = self.payment.amount * ACCOUTING_PERCENT todo
        when 'execution'
          #self.amount = self.payment.amount * EXECUTION_PERCENT todo
      end
    end
  end
end

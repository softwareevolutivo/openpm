class Distribution < ActiveRecord::Base
  belongs_to :payment

  validates :amount, distribution_allowed: true
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
          self.amount = (self.payment.amount * SALE_PERCENT) / 100
        when 'capitalization'
          self.amount = (self.payment.amount * CAPITAL_PERCENT) / 100
        when 'accounting'
          sale_distribution = Distribution.where("payment_id = ? and concept = 'sale'", self.payment.id).take
          capitalizacion_distribution = Distribution.where("payment_id = ? and concept = 'capitalization'", self.payment.id).take
          if sale_distribution and capitalizacion_distribution
            base_amount = self.payment.amount - sale_distribution.amount - capitalizacion_distribution.amount
            self.amount = (base_amount * ACCOUTING_PERCENT) / 100
          end
          #TODO create unique key payment concept in state in distribution
        when 'execution'
          sale_distribution = Distribution.where("payment_id = ? and concept = 'sale'", self.payment.id).take
          capitalizacion_distribution = Distribution.where("payment_id = ? and concept = 'capitalization'", self.payment.id).take
          if sale_distribution and capitalizacion_distribution
            base_amount = self.payment.amount - sale_distribution.amount - capitalizacion_distribution.amount
            self.amount = (base_amount * EXECUTION_PERCENT) / 100
          end
        else
          Rails.logger.debug "-------------------------------- WTF is #{self.concept} -------------------------------- "
      end
    end
  end

end

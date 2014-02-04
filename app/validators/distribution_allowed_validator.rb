class DistributionAllowedValidator < ActiveModel::EachValidator
  def validate_each (record, attribute, value)
    if record.concept == 'accounting' or record.concept == 'execution'
      sale_distribution = Distribution.where("payment_id = ? and concept = 'sale'", record.payment.id).take
      capitalizacion_distribution = Distribution.where("payment_id = ? and concept = 'capitalization'", record.payment.id).take
      unless sale_distribution or capitalizacion_distribution
        record.errors[attribute] << (options[:message] || 'a distribution for sale and capitalization must be created before this distribution')
        return false
      end
    end
    return true
  end
end
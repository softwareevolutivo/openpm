class Distribution < ActiveRecord::Base
  belongs_to :payment

  validates_inclusion_of :concept, in: %w{ sale capitalization execution }
  validates_inclusion_of :state, in: %w{ issued paid discarded }
end

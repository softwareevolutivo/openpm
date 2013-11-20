class Customer < ActiveRecord::Base
  validates :nif, :name, :presence => true
  validates :nif, :format => /\A[0-9]{13}\z/

  has_many :proyects, dependent: :restrict_with_error
end

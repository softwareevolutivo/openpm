class Employee < ActiveRecord::Base
  validates :email, :presence => true, :email => true
  validates :name, :last_name, :identification, presence: true
end

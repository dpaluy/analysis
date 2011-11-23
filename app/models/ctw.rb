class Ctw < ActiveRecord::Base
  has_many :ctw_collectors, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true
end

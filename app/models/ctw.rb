class Ctw < ActiveRecord::Base
  has_many :ctw_collectors, :dependent => :destroy
  belongs_to :quote
  
  validates :name, :presence => true, :uniqueness => true
end

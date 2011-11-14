class Value < ActiveRecord::Base
  belongs_to :quote
  
  validates :timestamp, :presence => true, :uniqueness => {:scope => :quote_id}
end

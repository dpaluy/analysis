class Value < ActiveRecord::Base
  belongs_to :quote
  paginates_per 200
  
  validates :timestamp, :presence => true, :uniqueness => {:scope => :quote_id}
end

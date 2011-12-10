class Account < ActiveRecord::Base
  attr_accessible :stock_amount, :cash, :total_stock_value, :analyzer_id, :timestamp
  
  belongs_to :analyzer
end

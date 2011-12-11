class Account < ActiveRecord::Base
  attr_accessible :stock_amount, :cash, :total_stock_value, :analyzer_id, :timestamp
  
  belongs_to :analyzer
  
  validates :timestamp, :presence => true, :uniqueness => {:scope => :analyzer_id}
  
  def profit
    self.cash + self.total_stock_value
  end
  
  def self.max_profit(analyzer_id)
#    Account.where("analyzer_id = ?", analyzer_id).inject()group_by(|timestamp| timestamp.to_date)
    #.map {|g| [g.timestamp.to_date, g.profit.to_f]}
  end
  
  def self.trading_days(analyzer_id)
    Account.where("analyzer_id = ?", analyzer_id).group("DATE(timestamp)").count
  end
end

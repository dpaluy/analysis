class Analyzer < ActiveRecord::Base
  has_many :actions, :dependent => :destroy
  has_many :accounts, :dependent => :destroy
  
  belongs_to :ctw
  
  validates :name, :presence => true, :uniqueness => true
  
  paginates_per 15
  
  validates :start_date, :date => { :before => Time.now }
    
  validates :end_date,
    :date => { :after => :start_date, :before => Time.now + 1.day } 

  def total
    last_account = self.accounts.order("timestamp ASC").last
    if (last_account.nil?)
      0
    else
      last_account.cash + last_account.total_stock_value
    end
  end
  
  def trading_days
    self.accounts.group("DATE(timestamp)").count
  end
  
end

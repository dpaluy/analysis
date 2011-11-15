class Analyzer < ActiveRecord::Base
  has_many :actions, :dependent => :destroy
  
  validates :start_date, :date => { :before => Time.now }
    
  validates :end_date,
    :date => { :after => :start_date, :before => Time.now + 1.day } 

  after_save :fill_actions
  
private

  def get_price(quote_id, timestamp)
    price = Value.find(:first, :conditions => ['quote_id = ? and timestamp >= ?', quote_id, timestamp]).value
  end

  def fill_actions
    collection = CtwCollector.where("ctw_id = ? and timestamp >= ? and timestamp <= ?", self.ctw_id, self.start_date, self.end_date)
    asset = 0
    collection.each do |col|
      cost = 0
      action_index = col.get_index_of_max
      if action_index == 1 # BUY
        if asset == 0
          cost = -get_price(quote_id, col.timestamp)
          asset += 1
          Action.new(:analyzer_id => self, :cost => cost, :amount => asset, :timestamp => col.timestamp ).save!
        end
      elsif action_index == 2 # SELL
        if asset > 0
          cost = get_price(quote_id, col.timestamp)
          asset -= 1
          Action.new(:analyzer_id => self, :cost => cost, :amount => asset, :timestamp => col.timestamp ).save!
        end
      end
    end
  end
  
end

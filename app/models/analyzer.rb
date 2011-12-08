class Analyzer < ActiveRecord::Base
  has_many :actions, :dependent => :destroy
  
  belongs_to :ctw
  
  paginates_per 10
  
  validates :start_date, :date => { :before => Time.now }
    
  validates :end_date,
    :date => { :after => :start_date, :before => Time.now + 1.day } 

  after_save :fill_actions
  
  def total
    last_asset = self.actions.order("timestamp ASC").last
    self.actions.sum(:cost) + (last_asset.amount * last_asset.cost.abs)
  end
  
private

  def get_price(quote_id, timestamp)
    v = Value.where(['quote_id = ? and timestamp >= ?', quote_id, timestamp]).order("timestamp ASC").first
    v.value
  end

  def fill_actions
    analyzer_id = self.id
    Action.delete_all(['analyzer_id = ?', analyzer_id])
    collection = CtwCollector.where("ctw_id = ? and timestamp >= ? and timestamp <= ?",
                       self.ctw_id, self.start_date, self.end_date).order("timestamp ASC")
    quote_id = Quote.find(Ctw.find(self.ctw_id).quote_id)
    asset = 0

    collection.each do |col|
      cost = 0
      action_index = col.get_index_of_max
      if action_index == 1 # BUY
        next if !self.all_actions && asset > 0

        cost = -get_price(quote_id, col.timestamp)
        asset += 1
        ac = Action.new(:analyzer_id => analyzer_id, :cost => cost, :amount => asset, :timestamp => col.timestamp )
        ac.save!
      elsif action_index == 2 # SELL
        next if !self.all_actions && asset < 1
        
        cost = get_price(quote_id, col.timestamp)
        asset -= 1
        Action.new(:analyzer_id => analyzer_id, :cost => cost, :amount => asset, :timestamp => col.timestamp ).save!
      end
    end
  end
  
end

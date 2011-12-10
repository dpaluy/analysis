class AnalyzerJob < Struct.new(:analyzer_id)

  def get_price(quote_id, timestamp)
    v = Value.where(['quote_id = ? and timestamp >= ?', quote_id, timestamp]).order("timestamp ASC").first
    v.value
  end

  def perform
    analyzer = Analyzer.find(analyzer_id)
    Action.delete_all(['analyzer_id = ?', analyzer.id])
    collection = CtwCollector.where("ctw_id = ? and timestamp >= ? and timestamp <= ?",     
                      analyzer.ctw_id,  
                      analyzer.start_date, analyzer.end_date).order("timestamp ASC")
    quote_id = Quote.find(Ctw.find(analyzer.ctw_id).quote_id)

    prev_account = Account.new(:stock_amount => 0, :cash => 0)
    collection.each do |col|
      action_index = col.get_index_of_max
      unless (action_index == 0)
        cost = get_price(quote_id, col.timestamp) 
        
        if action_index == 1 # BUY
          qty = prev_account.stock_amount + 1
          cash = prev_account.cash - (cost * 1)
        elsif action_index == 2 # SELL
          qty = prev_account.stock_amount - 1
          cash = prev_account.cash + (cost * 1)         
        end
        ac = Account.new(:stock_amount => qty, :cash => cash, 
              :total_stock_value => qty * cost, 
              :analyzer_id => analyzer_id, :timestamp => col.timestamp)
        ac.save!
        prev_account = ac
      end
    end
  end

#  def perform
#    analyzer = Analyzer.find(analyzer_id)
#    Action.delete_all(['analyzer_id = ?', analyzer.id])
#    collection = CtwCollector.where("ctw_id = ? and timestamp >= ? and timestamp <= ?",     
#                      analyzer.ctw_id,  
#                      analyzer.start_date, analyzer.end_date).order("timestamp ASC")
#    quote_id = Quote.find(Ctw.find(analyzer.ctw_id).quote_id)
#    asset = 0

#    collection.each do |col|
#      cost = 0
#      action_index = col.get_index_of_max
#      if action_index == 1 # BUY
#        next if !analyzer.all_actions && asset > 0

#        cost = get_price(quote_id, col.timestamp)
#        asset += 1
#        Action.new(:analyzer_id => analyzer_id, :cost => cost, :amount => asset, :timestamp => col.timestamp ).save!
#      elsif action_index == 2 # SELL
#        next if !analyzer.all_actions && asset < 1
#        
#        cost = get_price(quote_id, col.timestamp)
#        asset -= 1
#        Action.new(:analyzer_id => analyzer_id, :cost => cost, :amount => asset, :timestamp => col.timestamp ).save!
#      end
#    end
#  end  
  
end

class AnalyzerJob < Struct.new(:analyzer_id)

  def get_price(quote_id, timestamp)
    v = Value.where(['quote_id = ? and timestamp >= ?', quote_id, timestamp]).order("timestamp ASC").first
    v.value
  end

  def perform
    analyzer = Analyzer.find(analyzer_id)
    Account.where(['analyzer_id = ?', analyzer.id]).delete_all
    
    collection = CtwCollector.where("ctw_id = ? and timestamp >= ? and timestamp <= ?",     
                      analyzer.ctw_id,  
                      analyzer.start_date, analyzer.end_date).order("timestamp ASC")
    quote_id = Quote.find(Ctw.find(analyzer.ctw_id).quote_id)

    prev_account = {:stock_amount => 0, :cash => 0}
    prev_account[:cash] = 100000 if analyzer.all_actions
    
    collection.each do |col|
      action_index = col.get_index_of_max
      unless (action_index == 0)
        cost = get_price(quote_id, col.timestamp) 
        action_qty = 1        
        if action_index == 1 # BUY
          next if (analyzer.all_actions && prev_account[:cash] <= 0)
          qty = prev_account[:stock_amount] + action_qty
          cash = prev_account[:cash] - (cost * action_qty)
        elsif action_index == 2 # SELL
          #next if (analyzer.all_actions && prev_account[:stock_amount] < -200)
          qty = prev_account[:stock_amount] - action_qty
          cash = prev_account[:cash] + (cost * action_qty)
        end
        ac = Account.new(:stock_amount => qty, :cash => cash, 
              :total_stock_value => qty * cost, 
              :analyzer_id => analyzer_id, :timestamp => col.timestamp)
        ac.save!
        prev_account = {:stock_amount => ac.stock_amount, :cash => ac.cash}   
      end
    end
  end

end

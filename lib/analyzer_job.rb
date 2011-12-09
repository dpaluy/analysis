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
    asset = 0

    collection.each do |col|
      cost = 0
      action_index = col.get_index_of_max
      if action_index == 1 # BUY
        next if !analyzer.all_actions && asset > 0

        cost = -get_price(quote_id, col.timestamp)
        asset += 1
        ac = Action.new(:analyzer_id => analyzer_id, :cost => cost, :amount => asset, :timestamp => col.timestamp )
        ac.save!
      elsif action_index == 2 # SELL
        next if !analyzer.all_actions && asset < 1
        
        cost = get_price(quote_id, col.timestamp)
        asset -= 1
        Action.new(:analyzer_id => analyzer_id, :cost => cost, :amount => asset, :timestamp => col.timestamp ).save!
      end
    end
  end
  
end

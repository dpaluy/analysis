$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/.."
require 'config/environment'
require 'lib/progressbar'

def get_price(quote_id, timestamp)
  price = Value.find(:first, :conditions => ['quote_id = ? and timestamp >= ?', quote_id, timestamp]).value
end

desc "Analyzer"
task :analyze do
  Action.delete_all
  start_date = Date.parse('2008-01-01')
  end_date = Date.parse('2010-12-31')
  collection = CtwCollector.find(:all, :conditions => ['timestamp >= ? and timestamp <= ?',
    start_date, end_date])

  total = collection.length
  pbar = ProgressBar.new("#{total} records", total)
  analyzer_id = 1   #TODO
  asset = 0
  quote_id = 1 #TODO
  collection.each do |col|
    action_index = col.get_index_of_max
    if action_index == 1 # BUY
      if asset == 0
        cost = -get_price(quote_id, col.timestamp)
        asset += 1
        Action.new(:analyzer_id => analyzer_id, :cost => cost, :amount => asset, :timestamp => col.timestamp ).save!
      end
    elsif action_index == 2 # SELL
      if asset > 0
        cost = get_price(quote_id, col.timestamp)
        asset -= 1
        Action.new(:analyzer_id => analyzer_id, :cost => cost, :amount => asset, :timestamp => col.timestamp ).save!
      end
    end
    pbar.inc
  end
  
  pbar.finish
end


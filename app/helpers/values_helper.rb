module ValuesHelper

#  def values_series(quote)
#    start_time = quote.values.first.timestamp
#    end_time =  start_time + 1.minute
#    #quote.values.second.timestamp
#    (start_time..end_time).map { |d| 
#      v = @quote.values.where("timestamp = ?", d)
#      [v.timestamp, v.value]
#     }.inspect
#  end
end

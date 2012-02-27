module ApplicationHelper
  def stock_prices(quote_id, start_date, end_date)
    quote = Quote.find(quote_id)
    quote.values.where("timestamp >= ? AND timestamp <= ?", start_date, end_date).map {|v| [v.timestamp.to_i * 1000, v.value.to_f]}
  end
end


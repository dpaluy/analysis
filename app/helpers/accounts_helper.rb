module AccountsHelper

  def previous_day_for(date)
    link_to "< Prev", analyzer_accounts_path(:date => date.yesterday.to_s(:db))
  end

  def next_day_for(date)
    link_to "Next >", analyzer_accounts_path(:date => date.tomorrow.to_s(:db))
  end
  
  def paginate_date(analyzer, date)
    html = ""
    first_date = analyzer.accounts.order(:timestamp).first.timestamp.to_date
    last_date = analyzer.accounts.order(:timestamp).last.timestamp.to_date
    unless date == first_date
      html << "#{link_to '&laquo; First'.html_safe, analyzer_accounts_path(:date => first_date.to_s(:db))}&nbsp;"
      html << previous_day_for(date) 
    end
    html << "&nbsp; #{date.to_s} &nbsp;"
    unless date == last_date
      html << next_day_for(date)
      html << "&nbsp;#{link_to 'Last &raquo;'.html_safe, analyzer_accounts_path(:date => last_date.to_s(:db))}"
    end
    html.html_safe
  end
  
end

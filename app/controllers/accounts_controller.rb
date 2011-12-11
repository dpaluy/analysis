class AccountsController < ApplicationController
  def index
    @analyzer = Analyzer.find(params[:analyzer_id]) 
    if params[:date].nil?
      @date = @analyzer.accounts.order(:timestamp).first.timestamp.to_date
    else
      @date = Date.strptime(params[:date], "%Y-%m-%d") 
    end
    @accounts = @analyzer.accounts.order(:timestamp).where("timestamp >= ? and timestamp <= ?", @date, @date.next)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end
end

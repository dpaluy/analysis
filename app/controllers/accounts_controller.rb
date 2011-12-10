class AccountsController < ApplicationController
  def index
    @analyzer = Analyzer.find(params[:analyzer_id]) 
    @accounts = @analyzer.accounts.order(:timestamp).page params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end
end

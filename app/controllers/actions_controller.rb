class ActionsController < ApplicationController
  # GET /actions
  # GET /actions.json
  def index
    @analyzer = Analyzer.find(params[:analyzer_id]) 
    @actions = @analyzer.actions.order(:timestamp).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actions }
    end
  end
end

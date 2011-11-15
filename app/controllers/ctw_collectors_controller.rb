class CtwCollectorsController < ApplicationController
  # GET /ctw_collectors
  # GET /ctw_collectors.json
  def index
    @ctw_collectors = CtwCollector.order(:timestamp).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ctw_collectors }
    end
  end

end
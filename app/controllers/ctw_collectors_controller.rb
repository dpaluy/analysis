class CtwCollectorsController < ApplicationController
  # GET /ctw_collectors
  # GET /ctw_collectors.json
  def index
    @ctw = Ctw.find(params[:ctw_id])
    @ctw_collectors = @ctw.ctw_collectors.order(:timestamp).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ctw_collectors }
    end
  end

end

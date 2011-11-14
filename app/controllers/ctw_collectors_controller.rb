class CtwCollectorsController < ApplicationController
  # GET /ctw_collectors
  # GET /ctw_collectors.json
  def index
    @ctw_collectors = CtwCollector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ctw_collectors }
    end
  end

  # GET /ctw_collectors/1
  # GET /ctw_collectors/1.json
  def show
    @ctw_collector = CtwCollector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ctw_collector }
    end
  end

  # GET /ctw_collectors/new
  # GET /ctw_collectors/new.json
  def new
    @ctw_collector = CtwCollector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ctw_collector }
    end
  end

  # GET /ctw_collectors/1/edit
  def edit
    @ctw_collector = CtwCollector.find(params[:id])
  end

  # POST /ctw_collectors
  # POST /ctw_collectors.json
  def create
    @ctw_collector = CtwCollector.new(params[:ctw_collector])

    respond_to do |format|
      if @ctw_collector.save
        format.html { redirect_to @ctw_collector, notice: 'Ctw collector was successfully created.' }
        format.json { render json: @ctw_collector, status: :created, location: @ctw_collector }
      else
        format.html { render action: "new" }
        format.json { render json: @ctw_collector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ctw_collectors/1
  # PUT /ctw_collectors/1.json
  def update
    @ctw_collector = CtwCollector.find(params[:id])

    respond_to do |format|
      if @ctw_collector.update_attributes(params[:ctw_collector])
        format.html { redirect_to @ctw_collector, notice: 'Ctw collector was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ctw_collector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ctw_collectors/1
  # DELETE /ctw_collectors/1.json
  def destroy
    @ctw_collector = CtwCollector.find(params[:id])
    @ctw_collector.destroy

    respond_to do |format|
      format.html { redirect_to ctw_collectors_url }
      format.json { head :ok }
    end
  end
end

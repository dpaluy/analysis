class AnalyzersController < ApplicationController
  # GET /analyzers
  # GET /analyzers.json
  def index
    @analyzers = Analyzer.order(:quote_id).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @analyzers }
    end
  end

  # GET /analyzers/1
  # GET /analyzers/1.json
  def show
    @analyzer = Analyzer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @analyzer }
    end
  end

  # GET /analyzers/new
  # GET /analyzers/new.json
  def new
    @analyzer = Analyzer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @analyzer }
    end
  end

  # GET /analyzers/1/edit
  def edit
    @analyzer = Analyzer.find(params[:id])
  end

  # POST /analyzers
  # POST /analyzers.json
  def create
    @analyzer = Analyzer.new(params[:analyzer])

    respond_to do |format|
      if @analyzer.save
        format.html { redirect_to @analyzer, notice: 'Analyzer was successfully created.' }
        format.json { render json: @analyzer, status: :created, location: @analyzer }
      else
        format.html { render action: "new" }
        format.json { render json: @analyzer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /analyzers/1
  # PUT /analyzers/1.json
  def update
    @analyzer = Analyzer.find(params[:id])

    respond_to do |format|
      if @analyzer.update_attributes(params[:analyzer])
        format.html { redirect_to @analyzer, notice: 'Analyzer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @analyzer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyzers/1
  # DELETE /analyzers/1.json
  def destroy
    @analyzer = Analyzer.find(params[:id])
    @analyzer.destroy

    respond_to do |format|
      format.html { redirect_to analyzers_url }
      format.json { head :ok }
    end
  end
end

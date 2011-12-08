class CtwsController < ApplicationController
  # GET /ctws
  # GET /ctws.json
  def index
    @ctws = Ctw.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ctws }
    end
  end

  # GET /ctws/1
  # GET /ctws/1.json
  def show
    @ctw = Ctw.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ctw }
    end
  end

  # GET /ctws/new
  # GET /ctws/new.json
  def new
    @ctw = Ctw.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ctw }
    end
  end

  # GET /ctws/1/edit
  def edit
    @ctw = Ctw.find(params[:id])
  end

  # POST /ctws
  # POST /ctws.json
  def create
    @ctw = Ctw.new(params[:ctw])

    respond_to do |format|
      if @ctw.save
        format.html { redirect_to @ctw, notice: 'Ctw was successfully created.' }
        format.json { render json: @ctw, status: :created, location: @ctw }
      else
        format.html { render action: "new" }
        format.json { render json: @ctw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ctws/1
  # PUT /ctws/1.json
  def update
    @ctw = Ctw.find(params[:id])

    respond_to do |format|
      if @ctw.update_attributes(params[:ctw])
        format.html { redirect_to @ctw, notice: 'Ctw was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ctw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ctws/1
  # DELETE /ctws/1.json
  def destroy
    @ctw = Ctw.find(params[:id])
    @ctw.destroy

    respond_to do |format|
      format.html { redirect_to ctws_url }
      format.json { head :ok }
    end
  end
end

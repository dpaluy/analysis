class ValuesController < ApplicationController
  # GET /values
  # GET /values.json
  def index
    @quote = Quote.find(params[:quote_id]) 
    @values = @quote.values.order(:timestamp).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @values }
    end
  end

  # GET /values/new
  # GET /values/new.json
  def new
    @quote = Quote.find(params[:quote_id]) 
    @value = @quote.values.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @value }
    end
  end

  # GET /values/1/edit
  def edit
    @value = Value.find(params[:id])
  end

  # POST /values
  # POST /values.json
  def create
    @quote = Quote.find(params[:quote_id]) 
    @value = @quote.values.new(params[:value])
    respond_to do |format|
      if @value.save
        format.html { redirect_to quote_values_url(@value.quote_id), notice: 'Value was successfully created.' }
        format.json { render json: @value, status: :created, location: @value }
      else
        format.html { render action: "new" }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /values/1
  # PUT /values/1.json
  def update
    @value = Value.find(params[:id])

    respond_to do |format|
      if @value.update_attributes(params[:value])
        format.html { redirect_to quote_values_url(@value.quote_id), notice: 'Value was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1
  # DELETE /values/1.json
  def destroy
    @value = Value.find(params[:id])
    @value.destroy

    respond_to do |format|
      format.html { redirect_to quote_values_url(@value.quote_id) }
      format.json { head :ok }
    end
  end
end

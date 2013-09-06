class FileversionsController < ApplicationController
  # GET /fileversions
  # GET /fileversions.json
  def index
    @fileversions = Fileversion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fileversions }
    end
  end

  # GET /fileversions/1
  # GET /fileversions/1.json
  def show
    @fileversion = Fileversion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fileversion }
    end
  end

  # GET /fileversions/new
  # GET /fileversions/new.json
  def new
    @fileversion = Fileversion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fileversion }
    end
  end

  # GET /fileversions/1/edit
  def edit
    @fileversion = Fileversion.find(params[:id])
  end

  # POST /fileversions
  # POST /fileversions.json
  def create
    @fileversion = Fileversion.new(params[:fileversion])

    respond_to do |format|
      if @fileversion.save
        format.html { redirect_to @fileversion, notice: 'Fileversion was successfully created.' }
        format.json { render json: @fileversion, status: :created, location: @fileversion }
      else
        format.html { render action: "new" }
        format.json { render json: @fileversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fileversions/1
  # PUT /fileversions/1.json
  def update
    @fileversion = Fileversion.find(params[:id])

    respond_to do |format|
      if @fileversion.update_attributes(params[:fileversion])
        format.html { redirect_to @fileversion, notice: 'Fileversion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fileversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fileversions/1
  # DELETE /fileversions/1.json
  def destroy
    @fileversion = Fileversion.find(params[:id])
    @fileversion.destroy

    respond_to do |format|
      format.html { redirect_to fileversions_url }
      format.json { head :no_content }
    end
  end
end

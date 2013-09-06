class FilenamesController < ApplicationController
  # GET /filenames
  # GET /filenames.json
  def index
    @filenames = Filename.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @filenames }
    end
  end

  # GET /filenames/1
  # GET /filenames/1.json
  def show
    @filename = Filename.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @filename }
    end
  end

  # GET /filenames/new
  # GET /filenames/new.json
  def new
    @filename = Filename.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @filename }
    end
  end

  # GET /filenames/1/edit
  def edit
    @filename = Filename.find(params[:id])
  end

  # POST /filenames
  # POST /filenames.json
  def create
    @filename = Filename.new(params[:filename])

    respond_to do |format|
      if @filename.save
        format.html { redirect_to @filename, notice: 'Filename was successfully created.' }
        format.json { render json: @filename, status: :created, location: @filename }
      else
        format.html { render action: "new" }
        format.json { render json: @filename.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /filenames/1
  # PUT /filenames/1.json
  def update
    @filename = Filename.find(params[:id])

    respond_to do |format|
      if @filename.update_attributes(params[:filename])
        format.html { redirect_to @filename, notice: 'Filename was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @filename.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filenames/1
  # DELETE /filenames/1.json
  def destroy
    @filename = Filename.find(params[:id])
    @filename.destroy

    respond_to do |format|
      format.html { redirect_to filenames_url }
      format.json { head :no_content }
    end
  end
end

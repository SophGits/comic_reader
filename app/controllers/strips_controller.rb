class StripsController < ApplicationController
  # GET /strips
  # GET /strips.json
  def index
    @strips = Strip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @strips }
    end
  end

  # GET /strips/1
  # GET /strips/1.json
  def show
    @strip = Strip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @strip }
    end
  end

  # GET /strips/new
  # GET /strips/new.json
  def new
    @strip = Strip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @strip }
    end
  end

  # GET /strips/1/edit
  def edit
    @strip = Strip.find(params[:id])
  end

  # POST /strips
  # POST /strips.json
  def create
    @strip = Strip.new(params[:strip])

    respond_to do |format|
      if @strip.save
        format.html { redirect_to @strip, notice: 'Strip was successfully created.' }
        format.json { render json: @strip, status: :created, location: @strip }
      else
        format.html { render action: "new" }
        format.json { render json: @strip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /strips/1
  # PUT /strips/1.json
  def update
    @strip = Strip.find(params[:id])

    respond_to do |format|
      if @strip.update_attributes(params[:strip])
        format.html { redirect_to @strip, notice: 'Strip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @strip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strips/1
  # DELETE /strips/1.json
  def destroy
    @strip = Strip.find(params[:id])
    @strip.destroy

    respond_to do |format|
      format.html { redirect_to strips_url }
      format.json { head :no_content }
    end
  end
end

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
    @feed = Feed.find(params[:feed_id])
    @strip = Strip.find(params[:id])

    @comments = @strip.comments

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @strip }
    end
  end

  # GET /strips/new
  # GET /strips/new.json
  def new
    @feed = Feed.find(params[:feed_id])
    @strip = @feed.strips.new
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
    feed = Feed.find(params[:feed_id])
    strip = feed.strips.new(params[:strip])

    respond_to do |format|
      if strip.save
        format.html { redirect_to [feed, strip], notice: 'Strip was successfully created.' }
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

  # GET /strips/random.json
  def random
    render json: Strip.where(feed_id: params[:feed_id]).first(order: "RANDOM()")
  end
end

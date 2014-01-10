class FeedsController < ApplicationController
  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feeds }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    if not current_user
      redirect_to :new_user_session
      return
    end

    @feed = Feed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feed }
    end
  end

  # GET /feeds/new
  # GET /feeds/new.json
  def new
    @feed = Feed.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feed }
    end
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(params[:feed])

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render json: @feed, status: :created, location: @feed }
      else
        format.html { render action: "new" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.json
  def update
    @feed = Feed.find(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.json { head :no_content }
    end
  end

  def get_strip
    strip_id = params[:strip_id]
    feed = Feed.find(params[:feed_id])

    if strip_id.empty?
      # get strip based on notifications
      if current_user.subscriptions.where(feed_id: feed.id, active: true).empty?
        strip = feed.strips.order("created_at DESC").first
      else
        oldest_notification = Notification.where(feed_id: feed.id, user_id: current_user.id, active: true).order("created_at ASC").first

        if oldest_notification.nil?
          strip = feed.strips.order("created_at DESC").first
        else
          strip = Strip.find(oldest_notification.strip_id)

          oldest_notification.active = false
          oldest_notification.save
        end
      end
    else
      # get requested strip
      strip = Strip.find(strip_id)
    end

    next_strip_id = strip.id + 1
    previous_strip_id = strip.id - 1

    if strip.id == feed.strips.last.id
      next_strip_id = feed.strips.first.id
    elsif strip.id == feed.strips.first.id
      previous_strip_id = feed.strips.last.id
    end

    # comments = feed.strip.comments TRYING TO MAKE THIS AVAILABLE IN VIEW

    render json: strip.as_json.merge({next_strip_id: next_strip_id, previous_strip_id: previous_strip_id})
  end
end

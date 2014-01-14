class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    feed = Feed.find(params[:feed_id])
    @strip = feed.strips.find(params[:strip_id])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    # @comment = Comment.new

    feed = Feed.find(params[:feed_id])
    strip = feed.strips.find(params[:strip_id])
    @comment = feed.strips.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @feed = Feed.find(params[:feed_id])
    @strip = Strip.find(params[:strip_id])
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create

    feed = Feed.find(params[:feed_id])
    strip = feed.strips.find(params[:strip_id])
    @comment = strip.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [feed, strip], notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

   def upvote
    feed = Feed.find(params[:feed_id])
    strip = Strip.find(params[:strip_id])
    @comment = Comment.find(params[:id])
    current_user.likes(@comment)
    flash[:message] = 'Liked!'
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end


end

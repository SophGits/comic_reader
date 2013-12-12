class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    current_user_id = current_user.id
    messages = Message.select([:sender_id, :recipient_id]).where("sender_id = ? OR recipient_id = ?", current_user_id, current_user_id)

    user_ids = messages.map {|message| [message.sender_id, message.recipient_id] }
    unless user_ids.empty?
      user_ids.flatten!.uniq!
      user_ids.delete(current_user_id)
    end
    @users = []
    user_ids.each do |user_id|
      @users << User.select(:username).find(user_id)
     end

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @messages }
  end

  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    @sender = User.find(@message.sender_id)
    @recipient = User.find(@message.recipient_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    current_user_id = current_user.id
    @message = Message.new
    @message.sender_id = current_user_id

    @other_users = []
    users = User.all
    users.each do |user|
      unless
        user == current_user
        @other_users << user
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end


  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.sender_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end


  def conversation
    user_1_id = current_user.id
    user_1_username = current_user.username
    user_2 = User.select([:id, :username]).where(username: params[:username]).first
    user_2_id = user_2.id
    user_2_username = user_2.username

    @messages = Message.where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)", user_1_id, user_2_id, user_2_id, user_1_id)

    @messages.each do |message|
      if message.sender_id == user_1_id
        message.sender_username = user_1_username
        message.recipient_username = user_2_username
      else
        message.sender_username = user_2_username
        message.recipient_username = user_1_username
      end
    end
  end

end

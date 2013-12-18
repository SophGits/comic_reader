class UsersController < Devise::RegistrationsController

  def index
    @users = User.all
  end

  def show
    @users = User.all
  end

  def create
    # run default version defined in Devise::RegistrationsController
    super
    # then add our custom logic
    @user.role = "user"
    @user.save!
  end

  def edit
    # log the ancestors of this controller
    # to confirm that we inherit from ApplicationController
    logger.info self.class.ancestors
    super
  end



  def drawing_board
    @user = current_user
    @feeds = @user.feeds.where("subscriptions.active = 't'")
    # @notecount = Strip.where(feed_id: params[:feed_id], active: "true").first
    # @notifications = @strips.where(active: "true").first
  end

  # def unsubscribe
    # subscription = Subscription.where(user_id: current_user.id, feed_id: params[:feed_id], active: true).first


end

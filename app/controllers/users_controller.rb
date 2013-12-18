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
    if not current_user
      redirect_to :new_user_session
      return
    end

    @user = current_user
    @feeds = @user.feeds.where("subscriptions.active = 't'")
  end

# //Allows user to update information without providing password
  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(params[:user])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present?
  end


end

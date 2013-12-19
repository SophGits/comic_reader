class HomeController < ApplicationController

  def index
    # if current_user
    #   redirect_to dashboard_url
    # else
      @user = User.new
    # end


    rand_feed = Feed.all.sample
    @rand_strips = rand_feed.strips

  end

end

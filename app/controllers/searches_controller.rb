class SearchesController < ApplicationController
  def create
    @feeds = Feed.basic_search params[:query]
    render :index
  end
end

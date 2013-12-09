require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  setup do
    @feed = feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feed" do
    assert_difference('Feed.count') do
      post :create, feed: { author: @feed.author, down_vote_count: @feed.down_vote_count, feed_logo: @feed.feed_logo, feed_url: @feed.feed_url, flag_count: @feed.flag_count, keywords: @feed.keywords, main_url: @feed.main_url, summary: @feed.summary, up_vote_count: @feed.up_vote_count }
    end

    assert_redirected_to feed_path(assigns(:feed))
  end

  test "should show feed" do
    get :show, id: @feed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feed
    assert_response :success
  end

  test "should update feed" do
    put :update, id: @feed, feed: { author: @feed.author, down_vote_count: @feed.down_vote_count, feed_logo: @feed.feed_logo, feed_url: @feed.feed_url, flag_count: @feed.flag_count, keywords: @feed.keywords, main_url: @feed.main_url, summary: @feed.summary, up_vote_count: @feed.up_vote_count }
    assert_redirected_to feed_path(assigns(:feed))
  end

  test "should destroy feed" do
    assert_difference('Feed.count', -1) do
      delete :destroy, id: @feed
    end

    assert_redirected_to feeds_path
  end
end

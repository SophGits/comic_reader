require 'test_helper'

class StripsControllerTest < ActionController::TestCase
  setup do
    @strip = strips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:strips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create strip" do
    assert_difference('Strip.count') do
      post :create, strip: { down_vote_count: @strip.down_vote_count, flag_count: @strip.flag_count, keywords: @strip.keywords, strip_url: @strip.strip_url, up_vote_count: @strip.up_vote_count }
    end

    assert_redirected_to strip_path(assigns(:strip))
  end

  test "should show strip" do
    get :show, id: @strip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @strip
    assert_response :success
  end

  test "should update strip" do
    put :update, id: @strip, strip: { down_vote_count: @strip.down_vote_count, flag_count: @strip.flag_count, keywords: @strip.keywords, strip_url: @strip.strip_url, up_vote_count: @strip.up_vote_count }
    assert_redirected_to strip_path(assigns(:strip))
  end

  test "should destroy strip" do
    assert_difference('Strip.count', -1) do
      delete :destroy, id: @strip
    end

    assert_redirected_to strips_path
  end
end

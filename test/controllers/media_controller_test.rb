require 'test_helper'

class MediaControllerTest < ActionController::TestCase
  setup do
    @medium = media(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium" do
    assert_difference('Medium.count') do
      post :create, medium: { created_by: @medium.created_by, sort_id: @medium.sort_id, state_id: @medium.state_id, tag_id: @medium.tag_id, title: @medium.title, updated_by: @medium.updated_by }
    end

    assert_redirected_to medium_path(assigns(:medium))
  end

  test "should show medium" do
    get :show, id: @medium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium
    assert_response :success
  end

  test "should update medium" do
    patch :update, id: @medium, medium: { created_by: @medium.created_by, sort_id: @medium.sort_id, state_id: @medium.state_id, tag_id: @medium.tag_id, title: @medium.title, updated_by: @medium.updated_by }
    assert_redirected_to medium_path(assigns(:medium))
  end

  test "should destroy medium" do
    assert_difference('Medium.count', -1) do
      delete :destroy, id: @medium
    end

    assert_redirected_to media_path
  end
end

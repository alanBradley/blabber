require 'test_helper'

class BlabsControllerTest < ActionController::TestCase
  setup do
    @blab = blabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blab" do
    assert_difference('Blab.count') do
      post :create, blab: { body: @blab.body, title: @blab.title, url: @blab.url }
    end

    assert_redirected_to blab_path(assigns(:blab))
  end

  test "should show blab" do
    get :show, id: @blab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blab
    assert_response :success
  end

  test "should update blab" do
    patch :update, id: @blab, blab: { body: @blab.body, title: @blab.title, url: @blab.url }
    assert_redirected_to blab_path(assigns(:blab))
  end

  test "should destroy blab" do
    assert_difference('Blab.count', -1) do
      delete :destroy, id: @blab
    end

    assert_redirected_to blabs_path
  end
end

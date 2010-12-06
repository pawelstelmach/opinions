require 'test_helper'

class OpinionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opinions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opinion" do
    assert_difference('Opinion.count') do
      post :create, :opinion => { }
    end

    assert_redirected_to opinion_path(assigns(:opinion))
  end

  test "should show opinion" do
    get :show, :id => opinions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => opinions(:one).to_param
    assert_response :success
  end

  test "should update opinion" do
    put :update, :id => opinions(:one).to_param, :opinion => { }
    assert_redirected_to opinion_path(assigns(:opinion))
  end

  test "should destroy opinion" do
    assert_difference('Opinion.count', -1) do
      delete :destroy, :id => opinions(:one).to_param
    end

    assert_redirected_to opinions_path
  end
end

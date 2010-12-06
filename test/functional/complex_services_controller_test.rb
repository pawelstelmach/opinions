require 'test_helper'

class ComplexServicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complex_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complex_service" do
    assert_difference('ComplexService.count') do
      post :create, :complex_service => { }
    end

    assert_redirected_to complex_service_path(assigns(:complex_service))
  end

  test "should show complex_service" do
    get :show, :id => complex_services(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => complex_services(:one).to_param
    assert_response :success
  end

  test "should update complex_service" do
    put :update, :id => complex_services(:one).to_param, :complex_service => { }
    assert_redirected_to complex_service_path(assigns(:complex_service))
  end

  test "should destroy complex_service" do
    assert_difference('ComplexService.count', -1) do
      delete :destroy, :id => complex_services(:one).to_param
    end

    assert_redirected_to complex_services_path
  end
end

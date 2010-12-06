require 'test_helper'

class AtomicServicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atomic_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atomic_service" do
    assert_difference('AtomicService.count') do
      post :create, :atomic_service => { }
    end

    assert_redirected_to atomic_service_path(assigns(:atomic_service))
  end

  test "should show atomic_service" do
    get :show, :id => atomic_services(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => atomic_services(:one).to_param
    assert_response :success
  end

  test "should update atomic_service" do
    put :update, :id => atomic_services(:one).to_param, :atomic_service => { }
    assert_redirected_to atomic_service_path(assigns(:atomic_service))
  end

  test "should destroy atomic_service" do
    assert_difference('AtomicService.count', -1) do
      delete :destroy, :id => atomic_services(:one).to_param
    end

    assert_redirected_to atomic_services_path
  end
end

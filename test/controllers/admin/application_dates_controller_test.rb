require 'test_helper'

class Admin::ApplicationDatesControllerTest < ActionController::TestCase
  setup do
    @application_date = application_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_date" do
    assert_difference('Admin::ApplicationDate.count') do
      post :create, application_date: { end_at: @application_date.end_at, start_at: @application_date.start_at }
    end

    assert_redirected_to application_date_path(assigns(:application_date))
  end

  test "should show application_date" do
    get :show, id: @application_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_date
    assert_response :success
  end

  test "should update application_date" do
    patch :update, id: @application_date, application_date: { end_at: @application_date.end_at, start_at: @application_date.start_at }
    assert_redirected_to application_date_path(assigns(:application_date))
  end

  test "should destroy application_date" do
    assert_difference('Admin::ApplicationDate.count', -1) do
      delete :destroy, id: @application_date
    end

    assert_redirected_to application_dates_path
  end
end

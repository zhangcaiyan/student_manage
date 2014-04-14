require 'test_helper'

class Student::RewardApplicationsControllerTest < ActionController::TestCase
  setup do
    @reward_application = reward_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_application" do
    assert_difference('Student::RewardApplication.count') do
      post :create, reward_application: { application_id: @reward_application.application_id, content: @reward_application.content, phone: @reward_application.phone, rongyu: @reward_application.rongyu, user_id: @reward_application.user_id, xueyuan_id: @reward_application.xueyuan_id }
    end

    assert_redirected_to reward_application_path(assigns(:reward_application))
  end

  test "should show reward_application" do
    get :show, id: @reward_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_application
    assert_response :success
  end

  test "should update reward_application" do
    patch :update, id: @reward_application, reward_application: { application_id: @reward_application.application_id, content: @reward_application.content, phone: @reward_application.phone, rongyu: @reward_application.rongyu, user_id: @reward_application.user_id, xueyuan_id: @reward_application.xueyuan_id }
    assert_redirected_to reward_application_path(assigns(:reward_application))
  end

  test "should destroy reward_application" do
    assert_difference('Student::RewardApplication.count', -1) do
      delete :destroy, id: @reward_application
    end

    assert_redirected_to reward_applications_path
  end
end

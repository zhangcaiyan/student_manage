require 'test_helper'

class Admin::ZhuanyesControllerTest < ActionController::TestCase
  setup do
    @zhuanye = zhuanyes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zhuanyes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zhuanye" do
    assert_difference('Admin::Zhuanye.count') do
      post :create, zhuanye: { name: @zhuanye.name, xueyuan_id: @zhuanye.xueyuan_id }
    end

    assert_redirected_to zhuanye_path(assigns(:zhuanye))
  end

  test "should show zhuanye" do
    get :show, id: @zhuanye
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zhuanye
    assert_response :success
  end

  test "should update zhuanye" do
    patch :update, id: @zhuanye, zhuanye: { name: @zhuanye.name, xueyuan_id: @zhuanye.xueyuan_id }
    assert_redirected_to zhuanye_path(assigns(:zhuanye))
  end

  test "should destroy zhuanye" do
    assert_difference('Admin::Zhuanye.count', -1) do
      delete :destroy, id: @zhuanye
    end

    assert_redirected_to zhuanyes_path
  end
end

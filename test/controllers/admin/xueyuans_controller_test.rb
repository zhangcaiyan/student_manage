require 'test_helper'

class Admin::XueyuansControllerTest < ActionController::TestCase
  setup do
    @xueyuan = xueyuans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xueyuans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xueyuan" do
    assert_difference('Admin::Xueyuan.count') do
      post :create, xueyuan: { name: @xueyuan.name }
    end

    assert_redirected_to xueyuan_path(assigns(:xueyuan))
  end

  test "should show xueyuan" do
    get :show, id: @xueyuan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xueyuan
    assert_response :success
  end

  test "should update xueyuan" do
    patch :update, id: @xueyuan, xueyuan: { name: @xueyuan.name }
    assert_redirected_to xueyuan_path(assigns(:xueyuan))
  end

  test "should destroy xueyuan" do
    assert_difference('Admin::Xueyuan.count', -1) do
      delete :destroy, id: @xueyuan
    end

    assert_redirected_to xueyuans_path
  end
end

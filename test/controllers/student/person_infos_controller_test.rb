require 'test_helper'

class Student::PersonInfosControllerTest < ActionController::TestCase
  setup do
    @person_info = person_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_info" do
    assert_difference('Student::PersonInfo.count') do
      post :create, person_info: { gender_id: @person_info.gender_id, minzu: @person_info.minzu, name: @person_info.name, political: @person_info.political, score_id: @person_info.score_id, state: @person_info.state, user_id: @person_info.user_id, xuehao: @person_info.xuehao, zhiwu: @person_info.zhiwu, zhuanye: @person_info.zhuanye }
    end

    assert_redirected_to person_info_path(assigns(:person_info))
  end

  test "should show person_info" do
    get :show, id: @person_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_info
    assert_response :success
  end

  test "should update person_info" do
    patch :update, id: @person_info, person_info: { gender_id: @person_info.gender_id, minzu: @person_info.minzu, name: @person_info.name, political: @person_info.political, score_id: @person_info.score_id, state: @person_info.state, user_id: @person_info.user_id, xuehao: @person_info.xuehao, zhiwu: @person_info.zhiwu, zhuanye: @person_info.zhuanye }
    assert_redirected_to person_info_path(assigns(:person_info))
  end

  test "should destroy person_info" do
    assert_difference('Student::PersonInfo.count', -1) do
      delete :destroy, id: @person_info
    end

    assert_redirected_to person_infos_path
  end
end

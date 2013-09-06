require 'test_helper'

class FileversionsControllerTest < ActionController::TestCase
  setup do
    @fileversion = fileversions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fileversions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fileversion" do
    assert_difference('Fileversion.count') do
      post :create, fileversion: { file_size: @fileversion.file_size, file_version: @fileversion.file_version, update_time: @fileversion.update_time }
    end

    assert_redirected_to fileversion_path(assigns(:fileversion))
  end

  test "should show fileversion" do
    get :show, id: @fileversion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fileversion
    assert_response :success
  end

  test "should update fileversion" do
    put :update, id: @fileversion, fileversion: { file_size: @fileversion.file_size, file_version: @fileversion.file_version, update_time: @fileversion.update_time }
    assert_redirected_to fileversion_path(assigns(:fileversion))
  end

  test "should destroy fileversion" do
    assert_difference('Fileversion.count', -1) do
      delete :destroy, id: @fileversion
    end

    assert_redirected_to fileversions_path
  end
end

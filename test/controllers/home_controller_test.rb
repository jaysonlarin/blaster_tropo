require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get blast" do
    get :blast
    assert_response :success
  end

end

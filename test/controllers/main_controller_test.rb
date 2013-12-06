require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get control_panel" do
    get :control_panel
    assert_response :success
  end

end

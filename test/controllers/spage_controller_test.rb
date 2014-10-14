require 'test_helper'

class SpageControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get legal" do
    get :legal
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

end

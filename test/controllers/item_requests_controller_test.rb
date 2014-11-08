require 'test_helper'

class ItemRequestsControllerTest < ActionController::TestCase
  setup do
    @item_request = item_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_request" do
    assert_difference('ItemRequest.count') do
      post :create, item_request: { description: @item_request.description, fromDate: @item_request.fromDate, item_id_id: @item_request.item_id_id, price: @item_request.price, toDate: @item_request.toDate, user_id_id: @item_request.user_id_id }
    end

    assert_redirected_to item_request_path(assigns(:item_request))
  end

  test "should show item_request" do
    get :show, id: @item_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_request
    assert_response :success
  end

  test "should update item_request" do
    patch :update, id: @item_request, item_request: { description: @item_request.description, fromDate: @item_request.fromDate, item_id_id: @item_request.item_id_id, price: @item_request.price, toDate: @item_request.toDate, user_id_id: @item_request.user_id_id }
    assert_redirected_to item_request_path(assigns(:item_request))
  end

  test "should destroy item_request" do
    assert_difference('ItemRequest.count', -1) do
      delete :destroy, id: @item_request
    end

    assert_redirected_to item_requests_path
  end
end

require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should destroy cart' do
    assert_difference('Cart.count',-1) do
      session[:cart_id] = @cart.id
      delete :destroy, :id => @cart.to_param
    end
  end
end

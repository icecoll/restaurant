require 'test_helper'

class DeliveryControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

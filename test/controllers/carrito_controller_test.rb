require "test_helper"

class CarritoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carrito_show_url
    assert_response :success
  end
end

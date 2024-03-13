require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get reservas" do
    get admin_reservas_url
    assert_response :success
  end
end

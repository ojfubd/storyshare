require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get howto" do
    get pages_howto_url
    assert_response :success
  end
end

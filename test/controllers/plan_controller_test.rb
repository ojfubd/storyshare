require "test_helper"

class PlanControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get plan_new_url
    assert_response :success
  end

  test "should get create" do
    get plan_create_url
    assert_response :success
  end
end

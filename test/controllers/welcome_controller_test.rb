require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get landing" do
    get welcome_landing_url
    assert_response :success
  end
end

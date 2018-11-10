require 'test_helper'

class PumpsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pumps_create_url
    assert_response :success
  end

end

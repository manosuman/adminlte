require "test_helper"

class ArticlepagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articlepages_index_url
    assert_response :success
  end
end

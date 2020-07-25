require 'test_helper'

class Public::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_search_index_url
    assert_response :success
  end

end

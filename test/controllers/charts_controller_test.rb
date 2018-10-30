require 'test_helper'

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get charts_top_url
    assert_response :success
  end

end

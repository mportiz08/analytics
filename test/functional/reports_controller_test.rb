require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get top_urls" do
    get :top_urls
    assert_response :success
  end

  test "should get top_referrers" do
    get :top_referrers
    assert_response :success
  end

end

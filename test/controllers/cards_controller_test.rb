require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cards_index_url
    assert_response :success
  end

  test "should get show" do
    get cards_show_url
    assert_response :success
  end

end

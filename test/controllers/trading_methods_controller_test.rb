require 'test_helper'

class TradingMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trading_method = trading_methods(:one)
  end

  test "should get index" do
    get trading_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_trading_method_url
    assert_response :success
  end

  test "should create trading_method" do
    assert_difference('TradingMethod.count') do
      post trading_methods_url, params: { trading_method: { chart: @trading_method.chart, content1: @trading_method.content1, content2: @trading_method.content2, content3: @trading_method.content3, favorites_count: @trading_method.favorites_count, image1: @trading_method.image1, image2: @trading_method.image2, image3: @trading_method.image3, indicator: @trading_method.indicator, introduction: @trading_method.introduction, market: @trading_method.market, pair: @trading_method.pair, style: @trading_method.style, summery: @trading_method.summery, title: @trading_method.title, unusefuls_count: @trading_method.unusefuls_count, usefuls_count: @trading_method.usefuls_count, user_id: @trading_method.user_id } }
    end

    assert_redirected_to trading_method_url(TradingMethod.last)
  end

  test "should show trading_method" do
    get trading_method_url(@trading_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_trading_method_url(@trading_method)
    assert_response :success
  end

  test "should update trading_method" do
    patch trading_method_url(@trading_method), params: { trading_method: { chart: @trading_method.chart, content1: @trading_method.content1, content2: @trading_method.content2, content3: @trading_method.content3, favorites_count: @trading_method.favorites_count, image1: @trading_method.image1, image2: @trading_method.image2, image3: @trading_method.image3, indicator: @trading_method.indicator, introduction: @trading_method.introduction, market: @trading_method.market, pair: @trading_method.pair, style: @trading_method.style, summery: @trading_method.summery, title: @trading_method.title, unusefuls_count: @trading_method.unusefuls_count, usefuls_count: @trading_method.usefuls_count, user_id: @trading_method.user_id } }
    assert_redirected_to trading_method_url(@trading_method)
  end

  test "should destroy trading_method" do
    assert_difference('TradingMethod.count', -1) do
      delete trading_method_url(@trading_method)
    end

    assert_redirected_to trading_methods_url
  end
end

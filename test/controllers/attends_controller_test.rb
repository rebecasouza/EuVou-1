require 'test_helper'

class AttendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attend = attends(:one)
  end

  test "should get index" do
    get attends_url, as: :json
    assert_response :success
  end

  test "should create attend" do
    assert_difference('Attend.count') do
      post attends_url, params: { attend: { event_id: @attend.event_id } }, as: :json
    end

    assert_response 201
  end

  test "should show attend" do
    get attend_url(@attend), as: :json
    assert_response :success
  end

  test "should update attend" do
    patch attend_url(@attend), params: { attend: { event_id: @attend.event_id } }, as: :json
    assert_response 200
  end

  test "should destroy attend" do
    assert_difference('Attend.count', -1) do
      delete attend_url(@attend), as: :json
    end

    assert_response 204
  end
end

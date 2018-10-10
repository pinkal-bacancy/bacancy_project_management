require 'test_helper'

class LeaveListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leave_lists_new_url
    assert_response :success
  end

  test "should get index" do
    get leave_lists_index_url
    assert_response :success
  end

  test "should get edit" do
    get leave_lists_edit_url
    assert_response :success
  end

  test "should get show" do
    get leave_lists_show_url
    assert_response :success
  end

end

require "test_helper"

class SalarySlipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salary_slips_index_url
    assert_response :success
  end

  test "should get new" do
    get salary_slips_new_url
    assert_response :success
  end

  test "should get create" do
    get salary_slips_create_url
    assert_response :success
  end
end

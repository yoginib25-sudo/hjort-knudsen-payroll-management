require "test_helper"

class EmployeePasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get employee_passwords_new_url
    assert_response :success
  end

  test "should get update" do
    get employee_passwords_update_url
    assert_response :success
  end
end

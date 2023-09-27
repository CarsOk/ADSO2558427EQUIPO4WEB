require 'test_helper'

class FinanzasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get finanzas_index_url
    assert_response :success
  end

end

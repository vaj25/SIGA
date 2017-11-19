require 'test_helper'

class DetailIncomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get detail_incomes_index_url
    assert_response :success
  end

end

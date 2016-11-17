require 'test_helper'

class HavanacitytourControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

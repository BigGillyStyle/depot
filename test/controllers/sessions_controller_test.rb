require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    dave = users(:one)
    post :create_fixtures, name: dave.model_name_from_record_or_class, password: 'secret'
    assert_redirected_to admin_url
    assert_equal dave.__id__, session[:user_id]
  end

  test "should fail login" do
    dave = users(:one)
    post :create_fixtures, name: dave.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end
end

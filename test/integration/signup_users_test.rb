
require 'test_helper'

class SignupUsersTest < ActionDispatch::IntegrationTest


test "An user must signup" do
	get signup_path
	assert_template 'users/new'
	assert_difference 'User.count', 1 do
	post_via_redirect users_path, user: {username: "ayaz1", email: "ayaz1@swapextra.com", password:, "password", admin: false}
	#assert_template 'users/show'
   	#assert_match "ayaz1", response.body
    
end
end
end
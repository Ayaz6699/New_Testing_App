require "test_helper"

class CreateArticlesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "User", email: "user@example.com", password: "user")
  end
  
  test "Create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "Testing article create feature", description: "Body of the article"}
    end
  end
end
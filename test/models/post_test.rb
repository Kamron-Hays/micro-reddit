require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "JohnDoe", password: "password")
    @user.save # the 'id' field isn't populated until the user is saved to the database
    @post = Post.new(title: "Post #1", body: "This is the body of post #1", user_id:@user.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end

  test "title should not be too long" do
    @post.title = "a" * 65
    assert_not @post.valid?
  end

  test "title length in range is okay" do
    @post.title = "a" * 64
    assert @post.valid?
  end

  test "body should be present" do
    @post.body = "     "
    assert_not @post.valid?
  end

  test "body should not be too long" do
    @post.body = "a" * ((1024 * 10) + 1)
    assert_not @post.valid?
  end

  test "body length in range is okay" do
    @post.body = "a" * 1024 * 10
    assert @post.valid?
  end

  test "correct user is associated with post" do
    assert @post.user == @user
  end
end

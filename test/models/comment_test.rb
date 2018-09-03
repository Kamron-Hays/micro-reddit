require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "JohnDoe", password: "password")
    @user.save # the 'id' field isn't populated until the user is saved to the database
    @post = Post.new(title: "Post #1", body: "This is the body of post #1", user_id:@user.id)
    @post.save
    @comment = Comment.new(body: "This is the comment body", user_id:@user.id, post_id:@post.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "body should be present" do
    @comment.body = "     "
    assert_not @comment.valid?
  end

  test "body should not be too long" do
    @comment.body = "a" * ((1024 * 10) + 1)
    assert_not @comment.valid?
  end

  test "body length in range is okay" do
    @comment.body = "a" * 1024 * 10
    assert @comment.valid?
  end

  test "correct user and post is associated with comment" do
    assert @comment.user == @user
    assert @comment.post == @post
  end
end

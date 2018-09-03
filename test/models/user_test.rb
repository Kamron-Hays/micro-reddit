require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "JohnDoe", password: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be unique" do
    @user.save # can't be a duplicate until the first user is in the database.
    user2 = User.new(username: "JohnDoe", password: "derpderp")
    assert_not user2.valid?
  end

  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.username = "a" * 65
    assert_not @user.valid?
  end

  test "username length in range is okay" do
    @user.username = "a" * 64
    assert @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = "a" * 7
    assert_not @user.valid?
  end

  test "password should have a maximum length" do
    @user.password = "a" * 65
    assert_not @user.valid?
  end

  test "password length in range is okay" do
    @user.password = "a" * 64
    assert @user.valid?
    @user.password = "a" * 8
    assert @user.valid?
  end
end

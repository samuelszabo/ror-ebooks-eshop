require 'test_helper'

class PostsControllerUnAuthTest < ActionDispatch::IntegrationTest

  def setup
    sign_in users(:two)
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "raise get new" do
    assert_raise Exception do
      get new_post_url
    end
  end

  test "raise create post" do
    assert_raise Exception do
      post posts_url, params: {post: {content: @post.content, title: @post.title}}
    end
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "raise get edit" do
    assert_raise Exception do
      get edit_post_url(@post)
    end
  end

  test "raise update post" do
    assert_raise Exception do
      patch post_url(@post), params: {post: {content: @post.content, title: @post.title}}
    end
  end

  test "raise destroy post" do
    assert_raise Exception do
      delete post_url(@post)
    end
  end
end

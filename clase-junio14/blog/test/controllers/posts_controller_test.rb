require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "a customer can't create post if it's not authenticated" do
    user = users(:simon)
    post user_posts_path(user), params: {content: 'creando', title: 'Invalid post'}
    assert_redirected_to new_user_session_path
  end

  test "a customer can create post if it's authenticated" do
    user = users(:simon)
    user.password = '12345678'
    sign_in user
    post user_posts_path(user), params: {post: {content: 'creando', title: 'Valid post'}}
    assert_redirected_to user_post_path(user, Post.last)
    follow_redirect!
    assert_select "h3 strong", 'Valid post'
  end

  test "a customer can update its own post" do
    user = users(:simon)
    user.password = '12345678'
    sign_in user
    post user_posts_path(user), params: {post: {content: 'post to edit', title: 'Editing post'}}
    user_post = Post.last
    put user_post_path(user, user_post), {params: {post: {title: 'New title'}}, xhr: true}
    assert_equal 'text/javascript', @response.content_type
    assert body.include? ('New title')
    #puts body
  end

  test "a customer cannot edit another user post" do
    user1 = users(:simon)
    user2 = users(:mateo)
    sign_in user2
    user2_post = user1.post.first
    put user_post_path(user2, user2_post), {params: {post: {title: 'Changed, jaja'}}, xhr: true}
    assert body.include? ('Changed, jaja')
  end

  # test "a customer can view all its posts" do
  #   user = users(:simon)
  #   user.password = '12345678'
  #   sign_in user
  #   get user
  # end
end

require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = posts(:hola_mundo)
  end

  test "it should create a post with title and content" do
    user = users(:simon)
    post = Post.new title: 'Hola', content: 'My content', user: user
    assert post.save
  end

  test "it should validate content should be less than 140 characters" do
    @post.content = 'k' * 141
    @post.validate
    assert_includes @post.errors[:content], 'is too long (maximum is 140 characters)'
  end
  test "it should validate content should be greater than 0 characters" do
    @post.content = ''
    @post.validate
    assert_includes @post.errors[:content], 'is too short (minimum is 1 character)'
  end

  test "it should validate content must exist" do
    user = users(:simon)
    post = Post.new title: 'What is up', content: nil, user: user
    assert_nil post.content, 'El contenido no debe ser nulo'
  end

  test "it should validate title should be less than 100 characters" do
    @post.title = 'k' * 101
    @post.validate
    assert_includes @post.errors[:title], 'is too long (maximum is 100 characters)'
  end
  test "it should validate title should be greather than 0 characters" do
    @post.title = ''
    @post.validate
    assert_includes @post.errors[:title], 'is too short (minimum is 1 character)'
  end
end

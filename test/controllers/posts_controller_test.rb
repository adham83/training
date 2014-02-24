require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
    @update = {
    title: 'Here is the title',
    blurp: 'Here is the blurp',
    body: 'Here is the body'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #test "should create post" do
  # assert_difference('Post.count') do
  #    post :create, post: { blurp: @post.blurp, body: @post.body, title: @post.title }
  #  end

   test "should create post" do
      assert_difference('Post.count') do
      post :create, post: @update
  end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  #test "should update post" do
  #  patch :update, id: @post, post: { blurp: @post.blurp, body: @post.body, title: @post.title }
  #  assert_redirected_to post_path(assigns(:post))
  #end

  test "should update post" do
    put :update, id: @post, post: @update
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end

  test "should not save post without title" do
    post = Post.new
    assert !post.save
  end

  test "post values should not be empty" do
    post = Post.new
    assert post.invalid?
    assert post.errors[:title].any?
    assert post.errors[:blurp].any?
    assert post.errors[:body].any? 
  end

  test "blurp should be a string" do
    post = Post.new(title: posts(:one).title,
    blurp: posts(:one).blurp,
    body: "Body? Whose?")
    assert post.blurp.kind_of? String
  end

end

class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @post_categories = @post.categories.sort_by(&:name)
    @post_comments = @post.comments
    @comentators = @post.users.uniq.sort_by(&:username)
    @users= User.all
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all.sort_by(&:name)
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end

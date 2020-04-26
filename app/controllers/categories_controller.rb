class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @categories_posts = @category.posts
  end
end

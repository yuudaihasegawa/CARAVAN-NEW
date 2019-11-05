class BlogsController < ApplicationController
  def index
  	@blogs = Blog.all
  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def new
  	  @blog = Blog.new
  end

  def create
  	  blog = Blog.new(blog_params)
  	  blog.save
  	  redirect_to blogs_path
  end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def update
  	blog =Blog.new(blog_params[:id])
  	blog.update(blog_params)
  	redirect_to blogs_path(blog)
  end

  def destory
    blog = Blog.find(params[:id])
    blog.destory
    redirect_to blogs_path
  end

  private

  def blog_params
  	params.require(:blog).permit(:title,:category,:body)
  end
end

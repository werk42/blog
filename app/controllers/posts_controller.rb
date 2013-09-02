class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.tagged(params[:tag])
    else
      @posts = Post.all
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
end

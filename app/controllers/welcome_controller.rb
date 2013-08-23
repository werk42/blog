class WelcomeController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
    @recent_posts = @posts.limit(5)
    @archived_posts = Post.find(:all, :order => 'created_at DESC').group_by { |post| post.created_at.strftime("%B %Y")}
  end

  def show
    @post = Post.find(params[:id])
  end
end

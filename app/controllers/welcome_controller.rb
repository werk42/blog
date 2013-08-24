class WelcomeController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
    @recent_posts = @posts.limit(5)
  end
end

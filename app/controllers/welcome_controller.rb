class WelcomeController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.tagged(params[:tag])
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
end

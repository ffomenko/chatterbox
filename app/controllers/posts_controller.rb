class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to(posts_path, :notice => 'Post was successfully added.')
    else
      render :action => "new"
    end
  end

end

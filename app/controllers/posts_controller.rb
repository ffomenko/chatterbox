class PostsController < ApplicationController

  include PostPublisher

  def index
    @posts = Post.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      publish_post_create(@post)
      redirect_to(posts_path, :notice => 'Post was successfully added.')
    else
      render :action => "new"
    end
  end

end

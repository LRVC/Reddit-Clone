class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to post_path(@post), notice: "Your post was created successfully"
    else
      render :new
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content)
  end

end

class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :check_user
  before_action :check_owner, only: [:edit, :update, :destroy]


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

  def show
    @comments = Comment.all
  end

  def edit

  end

  def update
    if @post.update(posts_params)
      redirect_to root_path, notice: "Your post was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "#{@post.title} was destroyed"
  end


  private

  def posts_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def check_owner
    redirect_to root_path, notice: 'You are not the owner of this item' unless current_user.id == @post.user_id
  end
end

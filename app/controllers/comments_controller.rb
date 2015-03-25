class CommentsController < ApplicationController
  before_action :find_post_and_user
  before_action :check_user
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comments_params)
    @comment.update_attributes(user_id: @user.id)
    if @comment.save
      redirect_to post_path(@post), notice: "Comment created successfully"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @comment.update(comments_params)
      redirect_to post_path(@post), notice: "Comment updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path, notice: "Your comment was deleted successfully"
  end

  private

  def find_post_and_user
    @post = Post.find(params[:post_id])
    @user = User.find(current_user)
  end

  def comments_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def check_owner
    redirect_to root_path, notice: 'You are not the owner of this item' unless current_user.id == @comment.user_id
  end
end

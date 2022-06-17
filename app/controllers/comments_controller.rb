class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :comment_member).merge(user_id: current_user.id, member_id: params[:member_id])
  end
end

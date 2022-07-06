class CommentsController < ApplicationController

  def index
    @members = Member.includes(:user)
    @member = Member.find(params[:member_id])
    @comments = @member.comments.includes(:user).order('id DESC')
    @comment = Comment.new
    unless @member.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to request.referer
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :comment_member).merge(user_id: current_user.id, member_id: params[:member_id])
  end
end

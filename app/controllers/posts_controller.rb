class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member

  def show
    @post = Post.new
    @posts = @member.posts.includes(:user)
  end




  def create
    @post = @member.posts.new(post_params)
    if @post.save
      redirect_to member_path(@member.id)
    else
      redirect_to root_path
    end
  end

  

  

  private

  def post_params
    params.require(:post).permit(:day, :item_id).merge(user_id: current_user.id, member_id: @member.id)
  end

  def set_member
    @member = Member.find(params[:member_id])
  end

end


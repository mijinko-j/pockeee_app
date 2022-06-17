class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member
  before_action :set_month
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @members = Member.includes(:user)
    @items = Item.includes(:user)
    @post = Post.new
    
  end

  def show
    @members = Member.includes(:user)
    @items = Item.includes(:user)
    @post = Post.new
    @posts = @member.posts.includes(:user).order('day DESC').where(day: @month.all_month)
    @posts_sum = 0
      @posts.each do |post| 
        @posts_sum += Item.find_by(id: post.item_id).price
      end
      @posts_sum_total = @member.fixed + @posts_sum
    

    unless @member.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = @member.posts.new(post_params)
    if @post.save
      redirect_to action: :index
    else
      redirect_to root_path
    end
  end

  def edit
   
  end

  def update
    if @post.update(post_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to action: :show
  end

  private

  def post_params
    params.require(:post).permit(:day, :item_id).merge(user_id: current_user.id, member_id: @member.id)
  end

  def set_member
    @member = Member.find(params[:member_id])
  end

  def set_month
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @prev_month = @month.prev_month
    @next_month = @month.next_month
  end

  def set_post
    @post = Post.find(params[:id])
  end

  

end


class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.includes(:user)
  end

  def show
    unless @member.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
    unless @member.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @member.update(member_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :fixed, :color, :image).merge(user_id: current_user.id)
  end

  def set_member
    @member = Member.find(params[:id])
  end

end

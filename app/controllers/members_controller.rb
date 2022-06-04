class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.includes(:user)
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

  def show
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to member_path(@member.id)
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
    params.require(:member).permit(:image, :name, :fixed, :color).merge(user_id: current_user.id)
  end

  def set_member
    @member = Member.find(params[:id])
  end

end

class MembersController < ApplicationController
  before_action :authenticate_user!

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

  private

  def member_params
    params.require(:member).permit(:image, :name, :fixed, :color).merge(user_id: current_user.id)
  end

end

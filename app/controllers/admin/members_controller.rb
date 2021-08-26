class Admin::MembersController < ApplicationController
  
  before_action :if_not_admin

  def index
    # @members = Member.all
    @members = Member.page(params[:page]).per(5)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path(@member.id)
    else
      render "edit"
    end
  end

  private
  
  def if_not_admin
    redirect_to root_path unless admin_signed_in?
  end

  def member_params
    params.require(:member).permit(:name, :introduction, :image, :is_deleted, :email)
  end

end

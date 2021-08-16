class Public::MembersController < ApplicationController
  
  def index
    @members = Member.all
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
      redirect_to member_path(@member.id)
    else
      render "edit"
    end
  end
  
  def unsubscribe
    @member = current_member
  end
  
  def withdraw
    @member = current_customer
    @member.update(is_delete: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  private
  
  def member_params
    params.require(:member).permit(:name, :introduction, :image, :is_deleted, :email)
  end
    
end

class Public::MembersController < ApplicationController

  before_action :authenticate_member!

  before_action :correct_member, only: [:edit, :update]


  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    # 要変更（現在メンバー関係なく、レシピをすべて表示できている
    @recipes = @member.recipes
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

  def favorites
    @recipe = Recipe.find(params[:id])
    @favorites = Favorite.where(member_id: current_member.id)
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction, :image, :is_deleted, :email)
  end

  def correct_member
    @member = Member.find(params[:id])
    if current_member != @member
      redirect_to root_path
    end
  end
end

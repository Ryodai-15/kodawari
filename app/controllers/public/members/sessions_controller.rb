# frozen_string_literal: true

class Public::Members::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :reject_customer, only: [:create]
  
  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def reject_customer
    @member = Member.find_by(email: params[:member][:email].downcase)
    # //ログイン時に入力されたemailが存在するか探す。
    if @member
      if (@member.valid_password?(params[:member][:password]) && (@member.active_for_authentication? == false))
    # //入力されたパスワードが正しいこと 且つ　active_for_authentication?メソッドがfalseであるかどうか。
        flash[:alert] = "このアカウントは退会済みです。"
        redirect_to new_member_session_path
      end
    else
      flash[:alert] = "必須項目を入力してください"
    end
  end

end



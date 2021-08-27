class Public::HomesController < ApplicationController
  def top
    @all_ranks = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end

  def about; end

  def guest_sign_in
    member = Member.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in member
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end

class Public::FavoritesController < ApplicationController

  def create
    # recipe = Recipe.find(params[:recipe_id])
    # favorite = current_member.favorites.new(recipe_id: recipe.id)
    # 上が以前のコントローラ
    @recipe = Recipe.find(params[:recipe_id])
    favorite = @recipe.favorites.new(member_id: current_member.id)
    favorite.save
    # redirect_to product_recipe_path(recipe.product_id,recipe.id)→jsリクエストのため
  end

  def destroy
    # recipe = Recipe.find(params[:recipe_id])
    # favorite = current_member.favorites.find_by(recipe_id: recipe.id)
    # 上が以前のコントローラ
    @recipe = Recipe.find(params[:recipe_id])
    favorite = @recipe.favorites.find_by(member_id: current_member.id)
    favorite.destroy
    # redirect_to product_recipe_path(recipe.product_id,recipe.id)→jsリクエストのため
  end

end

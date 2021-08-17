class Public::FavoritesController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_member.favorites.new(recipe_id: recipe.id)
    favorite.save
    redirect_to product_recipe_path(recipe.product_id,recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_member.favorites.find_by(recipe_id: recipe.id)
    favorite.destroy
    redirect_to product_recipe_path(recipe.product_id,recipe.id)
  end

end
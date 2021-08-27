class Public::RecipesController < ApplicationController
  before_action :authenticate_member!

  before_action :correct_member, only: %i[edit update]

  def new
    @recipe = Recipe.new
  end

  def create
    # @recipe = current_member.recipes.new(recipe_params) レベル高い
    @recipe = Recipe.new(recipe_params)
    @recipe.product_id = params[:product_id]
    @recipe.member_id = current_member.id
    if @recipe.save
      redirect_to product_recipe_path(@recipe.product_id, @recipe.id)
    else
      render :new
    end
  end

  def index
    # @recipes = Recipe.all
    # @recipes = Recipe.page(params[:page]).per(3)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to product_recipe_path(@recipe.product_id, @recipe.id)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to products_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :name, :introduction, :kodawari)
  end

  def correct_member
    @recipe = Recipe.find(params[:id])
    # idをもとに投稿を特定
    @member = @recipe.member
    # 特定された投稿に紐づく、memberを特定し、@memberをいれる
    redirect_to root_path if current_member != @member
  end
end

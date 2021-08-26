class Public::ReviewsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @reviews = @recipe.reviews.page(params[:page]).per(5)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @review.recipe_id = params[:recipe_id]
    @review.member_id = current_member.id
    if @review.save
      redirect_to product_recipe_path(@recipe.product_id, @recipe.id)
    else
      # @recipe = Recipe.find(params[:id])
      render "public/recipes/show"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    review = @recipe.reviews.find(params[:id])
    # @review.recipe_id = params[:recipe_id]
    # @review.member_id = current_member.id
    if current_member.id == review.member.id
      review.destroy
      redirect_to product_recipe_path(@recipe.product_id, @recipe.id)
    else
       @reviews = @recipe.reviews
       render "public/reviews/index"
    end
  end

  private

  def review_params
    params.require(:review).permit(:recipe_id, :comment, :score, :member_id)
  end

end

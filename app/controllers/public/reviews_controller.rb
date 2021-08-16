class Public::ReviewsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @reviews = @recipe.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.recipe_id = params[:recipe_id]
    @review.member_id = current_member.id
    if @review.save
      redirect_to root_path
    else
      @recipe = Recipe.find(params[:id])
      render "recipes/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:recipe_id, :comment, :score, :member_id)
  end

end

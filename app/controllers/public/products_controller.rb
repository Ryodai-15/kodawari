class Public::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @recipes = Recipe.all
  end


  private

  def product_params
    params.require(:product).permit(:image, :name, :introduction, :kodawari)
  end

end

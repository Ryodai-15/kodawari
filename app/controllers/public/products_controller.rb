class Public::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    # @recipes = Recipe.all
    # 商品に紐付いたレシピを表示したい
    @recipes = @product.recipes
  end


  private

  def product_params
    params.require(:product).permit(:image, :name, :introduction, :kodawari)
  end

end

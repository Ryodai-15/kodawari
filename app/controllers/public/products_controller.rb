class Public::ProductsController < ApplicationController
  def index
    # @products = Product.all
    @products = Product.page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
    # @recipes = Recipe.all
    # 商品に紐付いたレシピを表示したい
    @recipes = @product.recipes.page(params[:page]).per(3)
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :introduction, :kodawari)
  end
end

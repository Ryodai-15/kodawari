class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @products = Product.all
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      render :new
    end
  end

  def index
    # @products = Product.all
    @products = Product.page(params[:page]).per(4)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render :edit
    end
  end

  private

    def product_params
      params.require(:product).permit(:image, :name, :introduction, :kodawari)
    end

end


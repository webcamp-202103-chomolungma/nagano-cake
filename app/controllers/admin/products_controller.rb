class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
#    genres = Genre
  end

  def create
    @product = product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:image_id,:name,:introduction,:price,:is_active)
  end

end



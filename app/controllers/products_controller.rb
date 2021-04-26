class ProductsController < ApplicationController
  PER = 10
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end


  private
  def product_params
    params.require(:product).permit(:image,:name,:introduction,:price,:is_active)
  end

end

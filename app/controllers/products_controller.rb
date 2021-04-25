class ProductsController < ApplicationController
#   PER = 10
  def index
# 雷の実装　イチロー
#     @products = Product.page(params[:page]).per(10)

    @products = Product.all

  end
  
  def show
    @product = Product.find(params[:id])
  end


  private
  def product_params
    params.require(:product).permit(:image,:name,:introduction,:price,:is_active)
  end

end

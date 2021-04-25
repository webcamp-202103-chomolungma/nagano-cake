class ProductsController < ApplicationController
  PER = 10
  def index
    @products = Product.page(params[:page]).per(10)
  end
  
  def show
  end
end

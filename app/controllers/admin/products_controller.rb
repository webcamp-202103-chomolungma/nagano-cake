class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
#    genres = Genre
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)

  # @product = Product.new(product_params)
  #   if @product.save
  #     flash[:notice] = "新商品を登録しました"
  #     redirect_to admin_product_path(@product)
  #   else
  #     render :new
  #   end

  end


  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:image,:name,:introduction,:price,:is_active)
  end

end



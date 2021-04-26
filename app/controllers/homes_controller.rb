class HomesController < ApplicationController
  PER = 4
  def top
    @products = Product.page(params[:page]).per(4)
  end

  def about
  end
end

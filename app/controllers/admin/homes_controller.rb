class Admin::HomesController < ApplicationController
  PER = 10

  def top
    @customers = Customer.page(params[:page]).per(10)
    # @customers = Customer.all.order(:id) ## idの降順
  end

  private
  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :email)
  end

end

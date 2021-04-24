class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all.order(:id) ## idの降順
  end
  
  private
  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :email)
  end
  
end

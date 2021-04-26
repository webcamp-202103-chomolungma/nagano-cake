class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  # def index
  #   @customer = Customer.find(params[:id])
  #   @customer = Customer.all
  # end
   PER = 10
  def index
    @customers = Customer.page(params[:page]).per(10)
    # @customers = Customer.all.order(:id) ## idの降順
  end

  def show
     @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end

  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted)
  end

  # private
  # def customer_params
  #     params.require(:customer).permit(:last_name, :first_name, :email, :is_deleted)
  # end

end

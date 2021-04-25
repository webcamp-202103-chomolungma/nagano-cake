class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  # def index
  #   @customer = Customer.find(params[:id])
  #   @customer = Customer.all
  # end
  def index
    # # byebug
    # @customers = Customer.find(params[:id])
    # @customers = Customer.all.order(:id) ## idの降順

    # is_deletedカラムにフラグを立てる(defaultはfalse)
    # @customer.update(is_deleted: true)
    # #ログアウトさせる
    # reset_session
    # flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    # redirect_to root_path
    @customers = Customer.all
    @customer = Customer.find(params:id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
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

  private
  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :email, :is_deleted)
  end

end

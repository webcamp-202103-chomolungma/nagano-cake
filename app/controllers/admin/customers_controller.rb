class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @customers = Customer.all.order(:id) ## idの降順
    # @customer = Customer.find(params[:id])
    # is_deletedカラムにフラグを立てる(defaultはfalse)
    # @customer.update(is_deleted: true)
    # #ログアウトさせる
    # reset_session
    # flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    # redirect_to root_path

    # @customer = Customer.find(params:id)
    # @customer.update(is_deleted: true)
    # reset_session
    # redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  # def hide
  #
  #

  private
  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :email, :is_deleted)
  end

end

class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
    # @customer = current_customer
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
      # @user.image = "default_icon.jpg"
    @address.save
    # flash[:notice] = "Welcome! You have signed up successfully.."
    redirect_to :addresses
  end

  def update
    @address = Address.find(params[:id])
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to :addresses
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end

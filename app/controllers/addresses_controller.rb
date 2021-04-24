class AddressesController < ApplicationController
  def index
    # byebug
    # @addresses = Adress.find(params:id)
    @addresses = Address.all
    
    # @addresses = current_customer.address
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
      # @user.image = "default_icon.jpg"
    @address.save
    # flash[:notice] = "Welcome! You have signed up successfully.."
    redirect_to @address
  end

  def update
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end

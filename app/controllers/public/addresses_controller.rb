class Public::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses
    @address = Address.new
    #@address_new = Address.find(params[:id])
  end

  def create
    @address = Address.new(addresses_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.update(addresses_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  def edit
     @address = Address.find(params[:id])
  end

   private

  def addresses_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end

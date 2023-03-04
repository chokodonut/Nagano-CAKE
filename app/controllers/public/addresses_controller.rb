class Public::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses
    @address = Address.new
    #@address = current_addresses
  end

  def create
    @address = Address.new(addresses_params)
    @address.save
    redirect_to addresses_path
  end

   private

  def addresses_params
    params.require(:addresses).permit(:name, :customer_id, :postal_code, :address)
  end
end

class Admin::HomesController < ApplicationController
  def top
    # @order = Order.find(params[:id])
    # @customer = Customer.find(params[:id])
  end

  def about
  end
  
  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :total_payment, :payment_method, :shipping_cost)
  end
end

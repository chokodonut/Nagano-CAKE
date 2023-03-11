class Public::OrdersController < ApplicationController
  def new
    @order = current_customer.orders.new
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
  end

  def index
  end

  def show
  end

  def comfirm
  end

  def complete
  end

   private

  def order_params
    params.require(:order).permit(:name, :addres, :postal_code, :payment_method)
  end
end

class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    @orders = Order.all.order(created_at: :desc).page(params[:page])
  end

  def about
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :total_payment, :payment_method, :shipping_cost)
  end
end

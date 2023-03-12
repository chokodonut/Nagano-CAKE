class Public::OrdersController < ApplicationController
  def new
    @order = current_customer.orders.new
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)

    if  @order.save
    #     cart_items.each do |cart_item|
    #       @order_detail = OrderDetail.new
    #       @order_detail.item_id = cart_item.item_id
    #       @order_detail.order_id = @order.id
    #       #@order_detail.
    #       @order_detail.save
    redirect_to orders_confirm_path
    end
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    #byebug
    @cart_items = current_customer.cart_items.all
    #address_numberの処理をifで分岐してインスタンス変数を書き換える
    #confirmにヒデンフィールドのバリューでそのインスタンス変数をいれてcreateアクションへいく
    
  end

  def complete
  end

   private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method, :address, :address_name)
  end

  def address_params
  params.require(:order).permit(:name, :address)
  end
end

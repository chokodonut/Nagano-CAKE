class Public::OrdersController < ApplicationController
  def new
    @order = current_customer.orders.new
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)

    if  @order.save
        current_customer.cart_items.each do |cart_item|
          @order_detail = OrderDetail.new
          @order_detail.item_id = cart_item.item_id
          @order_detail.order_id = @order.id
          @order_detail.amount = cart_item.amount
          @order_detail.price = cart_item.item.price
          @order_detail.making_status = 0
          @order_detail.save
        end
    redirect_to orders_confirm_path
    else
    @order = Order.new(order_params)
    render :new
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

    if  params[:order][:address_number] == "1"
        @order.name = current_customer.address_display
        #@order.postal_code = current_customer.postal_code
        #@order.address = current_customer.address
    elsif params[:order][:address_number] == "2"

          @order.name = Address.find_by(current_customer.address_display)
          @order.address = Address.find_by(address_id: current_customer.address)
          @order.postal_code = Address.find_by(address_id: current_customer.postal_code)
          #render :new

    elsif params[:order][:address_number] == "3"
          @address_new = current_customer.addresses.new(address_params)
          if address_new.save
          else
            render :new
          end
    end
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
  end

  def complete
  end

   private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method, :total_payment, :shipping_cost)
  end

  def address_params
  params.require(:order).permit(:name, :address)
  end
end

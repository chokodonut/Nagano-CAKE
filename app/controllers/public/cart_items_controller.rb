class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    #@total = 0
    @order = Order.new
  end

  def update
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @cart_item.update(amount: cart_item_params[:amount].to_i)
    redirect_to cart_items_path
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @already_cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    if @already_cart_item.present?
       @cart_item.amount +=  @already_cart_item.amount
       @already_cart_item.destroy
      #@cart_item = CartItem.new(cart_item_params)
      #@cart_item.customer_id = current_customer.id
      #binding.pry
    end
    @cart_item.save
    @order = Order.new
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find_by(customer_id: current_customer.id)
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end

class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @already_cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    if @already_cart_item.present?
       @cart_item.amount +=  @already_cart_item.amount
       @already_cart_item.destroy
      #データがある時
    #else
      #データがないとき
      #@cart_item = CartItem.new(cart_item_params)
      #@cart_item.customer_id = current_customer.id
      #binding.pry
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end

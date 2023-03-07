class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def create
    
    #amount = cart_item_params[:amount]
    #item_id = cart_item_params[:item_id]
    if
      #データがある時
    else
      #データがないとき
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      #binding.pry
      @cart_item.save
    end
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

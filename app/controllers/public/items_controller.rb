class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :is_active)
  end
end

class Public::ItemsController < ApplicationController
  def index
    @items = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :is_active)
  end
end

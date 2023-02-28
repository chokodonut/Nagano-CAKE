class Public::HomesController < ApplicationController
  def top
    @item = Item.find(item_params)
  end

  def about
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :is_active)
  end
end

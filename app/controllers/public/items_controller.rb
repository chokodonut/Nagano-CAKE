class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :is_active)
  end
end

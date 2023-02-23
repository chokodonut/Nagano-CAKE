class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
   redirect_to admin_item_parh(@item.id)
  end

  def index
    @items = Item.all
  end

  def update
  end

  def edit
  end

  def show
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :is_active)
  end
end

class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end
  
  def create
    item = Item.new(params_item)
    item.save
   #redirect_to admin_item_parh(@item.id)
  end
  
  def index
  end
  
  def update
  end
  
  def edit
  end

  def show
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :image)
  end
end

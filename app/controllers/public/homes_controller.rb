class Public::HomesController < ApplicationController
  def top
    @item = Item.order(created_at: :desc).limit(4)
    @genre = Genre.all
  end

  def about
  end
end

class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
  end
  
  def create
    genre = Genre.new(genre_params)
    genre.save
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  praivate
  
  def genre_params
    params.require(:genre).permit(:name)
  end  
end

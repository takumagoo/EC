class Public::ItemsController < ApplicationController
  def index
    @item = Item.new
    @genres = Genre.all
    if params[:genre].blank?
      @items = Item.all
    else
      @genre = Genre.find(params[:genre])
      @items = @genre.items
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end

class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all.order(created_at: :desc)
    if params[:genre].blank?
      @items = Item.all.order(created_at: :desc).page(params[:page]).per(8)
    else
      @genre = Genre.find(params[:genre])
      @items = @genre.items.order(created_at: :desc).page(params[:page]).per(8)
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end

class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(4)

    # if params[:genre].blank?
    #   # @items = Item.all
    #   @items = Item.all.order(created_at: :desc)
    # else
    #   @genre = Genre.find(params[:genre])
    #   @items = @genre.items.order(created_at: :desc)
    # end
  end
end

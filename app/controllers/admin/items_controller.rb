class Admin::ItemsController < ApplicationController
  def new
    # 空の変数
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    # リダイレクト (一応：一覧画面へ)
    redirect_to admin_items_path
  end

  def index
    # 一覧の変数
    @items = Item.all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    # リダイレクト (一応：一覧画面へ)
    redirect_to admin_items_path
  end


  private

  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :merch_image, :introduction, :genre_id, :price, :is_active)
  end

end

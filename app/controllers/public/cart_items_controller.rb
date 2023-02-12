class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = CartItem.new
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def index
    
  end
  
  def update
    
  end
  
   private

   # ストロングパラメータ
  def customer_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
  
end

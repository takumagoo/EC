class Public::CartItemsController < ApplicationController

  def create
    # @cart_item = CartItem.new(customer_params)
    @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    # @cart_item.customer_id = current_customer.id
    # 追加した商品がカート内に存在するかの判断
    if @cart_item
      # new_amountという変数を用意し、その中に@cart_item内の個数と新たに追加されたカート内(商品)の個数を足す
      new_amount = @cart_item.amount + cart_item_params[:amount].to_i
      @cart_item.update(amount: new_amount)
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
    end

    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.new
    @cart_items = CartItem.where(customer_id: current_customer.id).all

  end

  def update

  end
  
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

   private

   # ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end

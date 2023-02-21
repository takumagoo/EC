class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    # 詳細画面に遷移
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :billing_amount, :status, :postage)
    # params.require(:order_detail).permit(:orders_id, :item_id, :price, :amount, :making_status)
  end
end

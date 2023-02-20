class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
  end

  def update

  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :billing_amount, :status, :postage)
  end
end

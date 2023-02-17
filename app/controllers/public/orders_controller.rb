class Public::OrdersController < ApplicationController
  def new
    @order = Order.new


  end

  def confirm
    @order = Order.new(order_params)
    # @order.customer_id = current_customer.id

    if params[:order][:address_select] == "myaddress"

      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_select] == "registered_address"

      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_select] == "new_address"
      @order.postal_code = order_params[:postal_code]
      @order.address = order_params[:address]
      @order.name = order_params[:name]
    end

    # 送料
    @order.postage = 800

    # 商品合計
    # @cart_items = CartItem.find(params[:order][:address_id])
    @cart_items = CartItem.new
    @cart_items = CartItem.where(customer_id: current_customer.id).all
    @cart_subtotal = Order.new

  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save!
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  def complete

  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :billing_amount, :status)
  end
end

class Public::OrdersController < ApplicationController
  def new
    @order = Order.new


  end

  def confirm
    @order = Order.new(order_params)
    # @order.customer_id = current_customer.id

    # if params[:order][:payment_method] == "credit_card"
    @order.payment_method = params[:order][:payment_method]
    # elsif params[:order][:payment_method] == "transfer"
    #   @order.payment_method = current_customer.payment_method_transfer
    # end

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
    # order(親)
    @order = current_customer.orders.new(order_params)

    @order.save!

    # order_detail(子)
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.making_status = 0
      order_detail.price = cart_item.item.with_tax_price
      order_detail.save
    end

    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @cart_subtotal = Order.new
  end

  def complete

  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :billing_amount, :status, :postage)
  end
end

class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

    # 自身の住所
    # if current_customer

    # 登録済み住所
    # elsif
    # 新しいお届け先

    # end
  end

  def confirm
    @order = Order.new(order_params)
    # @order.customer_id = current_customer.id

    if params[:order][:address_select] == "myaddress"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_select] == "registered_address"
      # @order.
    elsif params[:order][:address_select] == "new_address"
      # @order.
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save!
    redirect_to orders_complete_path
  end
  def index

  end

  def show
  end

  def complete

  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end

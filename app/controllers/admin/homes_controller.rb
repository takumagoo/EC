class Admin::HomesController < ApplicationController
  def top
    @order = Order.new
    @orders = Order.all.page(params[:page])

  end

  def about

  end
end

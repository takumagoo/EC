class Admin::HomesController < ApplicationController
  def top
    @order = Order.new
    @orders = Order.all
     
  end
  
  def about
    
  end
end

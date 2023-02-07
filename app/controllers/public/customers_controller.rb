class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
  end

  def withdrawa
    @customer = Customer.new
    @customer.update(is_deleted: ture)
    reset_session
    redirect_to root_path
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def destroy
    
  end

  private

   # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end

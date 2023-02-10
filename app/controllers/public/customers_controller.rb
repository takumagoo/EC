class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
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

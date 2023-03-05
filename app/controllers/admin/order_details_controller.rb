class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order_details = @order.order_details.all

    is_updated = true

    if @order_detail.update(order_detail_params)

      @order.update(status: 2) if @order_detail.making_status == "under_const"

        # 製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
        # 紐付いている注文商品の製作ステータスを一つ一つeach文で確認していきます。
        @order_details.each do |order_detail|

          # 製作ステータスが「製作完了」ではない場合
        if order_detail.making_status != "product_complete"

          is_updated = false # 上記で定義してあるis_updatedを「false」に変更する。
        end
      end
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。
      # 上記のif文でis_updatedがfalseになっている場合、更新されません。
      @order.update(status: 3) if is_updated

    end
    # 詳細画面に遷移
    redirect_to admin_order_path(@order_detail.order_id)
  end

   private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end

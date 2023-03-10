class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum making_status: { cannot_craft: 0, wait_product: 1, under_const: 2, product_complete: 3 }
    
     # 小計
  def subtotal
    item.with_tax_price*amount
  end
end

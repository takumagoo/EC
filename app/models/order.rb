class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :customer
    
    # クレジットカードと銀行振込は注文テーブルにある payment_method(支払い方法)カラムに入る内容である為
    enum payment_method: { credit_card: 0, transfer: 1 }
end

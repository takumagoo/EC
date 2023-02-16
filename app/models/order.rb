class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :customer
    
    # クレジットカードと銀行振込は注文テーブルにある payment_method(支払い方法)カラムに入る内容である為
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum address_select: { myaddress: 0, registered_address: 1, new_address: 2 }
    enum status: { wait_payment: 0, payment_confirm: 1, product: 2, prepar_ship: 3, sent: 4 }
    
    # def 
    # end
end

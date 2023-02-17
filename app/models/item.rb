class Item < ApplicationRecord
    # 商品画像をactive_storageと紐づけ
    has_one_attached :merch_image
    has_many :order_details, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    belongs_to :genre

    def get_merch_image(width, height)
        unless merch_image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          merch_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        merch_image.variant(resize_to_limit: [width, height]).processed
    end
    
    def with_tax_price
     (price * 1.1).floor
    end

end

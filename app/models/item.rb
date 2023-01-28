class Item < ApplicationRecord
    # 商品画像をactive_storageと紐づけ
     has_one_attached :merch_image
    
    belongs_to :genre
    
    def get_merch_image(width, height)
        merch_image.variant(resize_to_limit: [width, height]).processed
    end


end

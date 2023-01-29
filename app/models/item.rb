class Item < ApplicationRecord
    # 商品画像をactive_storageと紐づけ
     has_one_attached :merch_image

    belongs_to :genre

    def get_merch_image(width, height)
        unless merch_image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          merch_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        merch_image.variant(resize_to_limit: [width, height]).processed
    end


end

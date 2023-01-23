class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      # ジャンルID
      t.integer :genre_id
      # 商品名
      t.string :name
      # 商品説明文
      t.text :introduction
      # 税抜き価格
      t.integer :price
      # 販売ステータス
      t.boolean :is_active
      # 登録日時
      t.datetime :created_at
      # 更新日時
      t.datetime :updated_at

      t.timestamps
    end
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name, length: {maximum: 40} 
    validates :introduction, length: {maximum: 1000}
    validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } 
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than: 10000000}
    validates :image

    with_options numericality: {other_than: 0} do
      validates :prefecture_id
      validates :shipping_date_id
      validates :postage_id
      validates :category_id
      validates :status_id
    end
  end



  has_one_attached :image
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  has_one :purchase

end

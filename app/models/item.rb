class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, length: {maximum: 40}, presence: true 
  validates :introduction, length: {maximum: 1000}, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than: 10000000}
  validates :image, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :postage_id, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true



  has_one_attached :image
  belongs_to :user

  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
end

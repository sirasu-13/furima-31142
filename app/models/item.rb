class Item < ApplicationRecord
  belongs_to       :user
  has_many         :comments
  has_one          :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :status
  belongs_to       :shipping_fee
  belongs_to       :area
  belongs_to       :guideline

 with_options presence: true do
  validates :title
  validates :image
  validates :description
  validates :category_id
  validates :status_id
  validates :shipping_fee_id
  validates :area_id
  validates :guideline_id
  validates :price
 end
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 99_999_999
  }
  validates :price, format: { with: /\A[0-9]+\z/ }
 with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :shipping_fee_id
  validates :area_id
  validates :guideline_id
 end
end

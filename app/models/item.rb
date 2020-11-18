class Item < ApplicationRecord
  belongs_to       :user
  has_many         :comments
  has_one          :purchase
  has_one_attached :image

  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :area_id, presence: true
  validates :guideline_id, presence: true
  validates :price, presence: true
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 99_999_999
  }
  validates :price, format: { with: /\A[0-9]+\z/ }
end

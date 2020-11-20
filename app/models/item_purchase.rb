class ItemPurchase
  include ActiveModel::Model
  attr_accessor :token, :post_number, :area_id, :municipality, :house_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :post_number
    validates :area_id
    validates :municipality
    validates :house_number
    validates :building_name
    validates :phone_number
  end

  with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :post_number, length: { is: 8 }
  end

  validates :area_id, numericality: { other_than: 1 }
  validates :phone_number, format: { with: /\A\d{11}\z/ }

  def save
    Address.create(post_number: post_number, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end
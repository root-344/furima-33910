class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :ship_region_id, :ship_city, :ship_address, :ship_building, :phone, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :ship_city
    validates :ship_address
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :token
  end  
  validates :ship_region_id, numericality: {other_than: 1, message: "Select"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, ship_region_id: ship_region_id, ship_city: ship_city, ship_address: ship_address, ship_building: ship_building, phone: phone, purchase_id: purchase.id)
  end
end
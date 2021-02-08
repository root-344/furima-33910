class Item < ApplicationRecord
  with_options presence: true do
    validates :product
    validates :class_id
    validates :product_description
    validates :product_states_id
    validates :shippong_charges_id
    validates :region_id
    validates :eta_id
    validates :price
  end
  belongs_to :user
  has_one_attached :images
end

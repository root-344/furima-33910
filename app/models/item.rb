class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  with_options presence: true do
    validates :product
    validates :category_id, numericality: { other_than: 1 }
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

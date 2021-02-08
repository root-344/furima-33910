class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_states
  belongs_to :shippong_charges
  belongs_to :region_id
  belongs_to :eta_id
  
  with_options presence: true do
    validates :product
    validates :category_id, numericality: { other_than: 1 }
    validates :product_description
    validates :product_states_id, numericality: { other_than: 1 }
    validates :shippong_charges_id, numericality: { other_than: 1 }
    validates :region_id, numericality: { other_than: 1 }
    validates :eta_id, numericality: { other_than: 1 }
    validates :price
  end
  belongs_to :user
  has_one_attached :images
end

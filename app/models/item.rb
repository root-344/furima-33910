class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_states
  belongs_to :shipping_charges
  belongs_to :region
  belongs_to :eta
  belongs_to :user
  has_one_attached :images

  with_options presence: true do
    validates :product
    validates :category_id, numericality: { other_than: 1 }
    validates :product_description
    validates :product_states_id, numericality: { other_than: 1 }
    validates :shipping_charges_id, numericality: { other_than: 1 }
    validates :region_id, numericality: { other_than: 1 }
    validates :eta_id, numericality: { other_than: 1 }
    validates :price
  end
end

FactoryBot.define do
  factory :item do
    product { 'ggaga' }
    category_id { 2 }
    product_description { 'gage' }
    product_states_id { 2 }
    shipping_charges_id { 2 }
    region_id { 2 }
    eta_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

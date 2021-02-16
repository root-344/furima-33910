FactoryBot.define do
  factory :purchase_address do
    zip { '111-1111'}
    ship_region_id { 3 }
    ship_city { '世田谷区' }
    ship_address { '青山1-1-1' }
    ship_building { '柳ビル203' }
    phone {'12345678901'}
  end
end

require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    describe '商品購入' do
      context '保存ができるとき' do
       it '必要な項目に全て記載があれば保存できること' do
         expect(@purchase_address).to be_valid
       end
       it 'ship_buildingは空でも保存できること' do
         @purchase_address.ship_building = nil
         expect(@purchase_address).to be_valid
       end
      end
      context '保存できないとき' do
        it 'zipが空だと保存できないこと' do
          @purchase_address.zip = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Zip can't be blank", "Zip is invalid. Include hyphen(-)")
        end
        it 'zipの保存にはハイフンが必要であること' do
          @purchase_address.zip = '1111111'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
        end
        it 'ship_region_idが空だと保存できないこと' do
          @purchase_address.ship_region_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Ship region Select")
        end
        it 'ship_cityが空だと保存できないこと' do
          @purchase_address.ship_city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Ship city can't be blank")
        end
        it 'ship_addressが空だと保存できないこと' do
          @purchase_address.ship_address = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Ship address can't be blank")
        end
        it 'phoneが空だと保存できないこと' do
          @purchase_address.phone = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
        end
        it '電話番号は11桁以内の数値でないと保存できないこと' do
          @purchase_address.phone = 111111111111
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
        end
        it 'phoneが全角数字だと保存できないこと' do
          @purchase_address.phone = "１２３４５６７８９０１"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
        end
        it 'phoneは英数混合では保存できないこと' do
          @purchase_address.phone = "1234567890a"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
        end
        it 'tokenが空では保存できないこと' do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
end

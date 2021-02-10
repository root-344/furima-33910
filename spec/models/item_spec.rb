require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do

    it '全ての項目があれば投稿できること' do
      expect(@item).to be_valid
    end
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.product = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.product_description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
     @item.category_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態についての情報が必須であること' do
      @item.product_states_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product states must be other than 1")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.eta_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Eta must be other than 1")
    end
    it '販売価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
    end
    it '販売価格は、¥300以上で保存可能であること' do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it '販売価格は、¥9,999,999以下で保存可能であること' do
      @item.price = 999999999999999
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end







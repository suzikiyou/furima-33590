require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'image, proprietary_name, product_description, category_id, condition_id, shipping_charge_id, prefectures_id, days_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

   context '商品出品がうまくいかないとき' do
     it 'imageが空だと出品できない' do
       @item.image = nil
       @item.valid?
       expect( @item.errors.full_messages).to include("Image can't be blank")
      end

     it 'proprietary_nameが空だと出品できない' do
        @item.proprietary_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Proprietary name can't be blank")
      end

      it 'product_descriptionが空だと出品できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it 'category_idが0を選択している場合出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it 'condition_idが0を選択している場合登録できな出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end

      it 'shipping_charge_idが0を選択している場合出品できない' do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 0")
      end

      it 'prefectures_idが0を選択している場合出品できない' do
        @item.prefectures_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 0")
      end

      it 'days_idが0を選択している場合出品できない' do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 0")
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角英語だけだと出品できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが半角英数混合だと出品できない' do
        @item.price = '30ab'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが全角文字ではだと出品できない' do
        @item.price = 'ABCD'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが300円以上でないと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが9999999円以上でないと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
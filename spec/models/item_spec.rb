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

      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it 'condition_idが空だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end

      it 'shipping_charge_idが空だと出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end

      it 'prefectures_idが空だと出品できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures is not a number")
      end

      it 'days_idが空だと出品できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days is not a number")
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
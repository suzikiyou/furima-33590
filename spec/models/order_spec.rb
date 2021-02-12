require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

 describe '商品購入' do
  context '商品購入がうまくいくとき' do
    it 'zip_code, prefecture_id, municipality, street_number, building_name, telephone_numberが存在すれば購入できる' do
      expect(@order).to be_valid
    end
  end

  context '商品購入がうまくいかないとき' do
    it 'zip_codeが空だと購入できない' do
      @order.zip_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip code can't be blank")
    end

    it 'prefecture_idが0を選択している場合購入できない' do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it 'municipalityが空だと購入できない' do
      @order.municipality = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    
    it 'street_numberが空だと購入できない' do
      @order.street_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Street number can't be blank")
    end
    
    it 'telephone_numberが空だと購入できない' do
      @order.telephone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'zip_codeに-がないと購入できない' do
      @order.zip_code= '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip code is invalid. Zip code (including '-' and 7 digits).")
    end

    it 'telephone_numberに-があると購入できない' do
      @order.telephone_number = '090-1234-56'
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number is invalid. Telephone number (11 digits without hyphen). ")
    end
  end
 end
end
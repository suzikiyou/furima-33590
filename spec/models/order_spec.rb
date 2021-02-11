require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '商品購入' do
  context '商品購入がうまくいくとき' do
    it 'zip_code, prefecture_id, municipality, street_number, telephone_numberが存在すれば購入できる' do
      expect(@item).to be_valid
    end
  end

 context '商品購入がうまくいかないとき' do
  it 'zip_codが空だと購入できない' do
   @item.zip_cod = 
   @item.valid?
   expect( ).to include()
  end

  it 'prefecture_idが0を選択している場合購入できない' do
    @item.prefecture_id = 0
    @item.valid?
    expect( ).to include()
  end

  it 'municipalityが空だと購入できない' do
    @item.municipalit = 
    @item.valid?
    expect( ).to include()
  end
   
  it 'street_numberが空だと購入できない' do
    @item.street_number = 
    @item.valid?
    expect( ).to include()
  end
   
  it 'telephone_numberが空だと購入できない' do
    @item.telephone_number = 
    @item.valid?
    expect( ).to include()
  end
end
end
class Order
  include ActiveModel::Model

  attr_accessor :zip_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number, :user_id, :item_id, :token
  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Zip code (including '-' and 7 digits)." }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipality
    validates :street_number
    validates :building_name
    validates :telephone_number, format: { with: /\A\d{11}\z/, message: "is invalid. Telephone number (11 digits without hyphen). " }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    PurchaseAddress.create(zip_code: zip_code, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number, building_name:building_name, telephone_number: telephone_number,)
  end
 
 end
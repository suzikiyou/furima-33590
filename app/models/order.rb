class Order
  include ActiveModel::Model

  attr_accessor :zip_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :zip_code
    validates :prefecture_id
    validates :municipality
    validates :street_number
    validates :building_name
    validates :telephone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    # Purchase.create(user_id: ,item_id: )
    # PurchaseAddress.create(:zip_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number, :purchase, :user, :item)
  end

 end
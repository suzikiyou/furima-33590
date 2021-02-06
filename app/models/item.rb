class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :proprietary_name
    validates :product_description
    validates :price, numericality: { greater_than_or_equal_to: 1, greater_than_or_equal_to: 300, message: "is out of setting range" }
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefectures_id
    validates :days_id
  end
end
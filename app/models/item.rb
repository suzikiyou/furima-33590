class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day

    validates :proprietary_name, presence: true
    validates :product_description, presence: true
    validates :price, presence: true
    validates :category_id, numericality: { other_than: 0 } 
    validates :condition_id, numericality: { other_than: 0 } 
    validates :shipping_charge_id, numericality: { other_than: 0 } 
    validates :prefectures_id, numericality: { other_than: 0 } 
    validates :days_id, numericality: { other_than: 0 } 
end

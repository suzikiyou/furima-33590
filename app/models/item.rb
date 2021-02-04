class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipp_ingcharge
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :day

  with_options presence: true do
    validates :category_id, numericality: { other_than: 0 } 
    validates :condition_id, numericality: { other_than: 0 } 
    validates :shipping_charge_id, numericality: { other_than: 0 } 
    validates :prefectures_id, numericality: { other_than: 0 } 
    validates :days_id, numericality: { other_than: 0 } 
  end
end

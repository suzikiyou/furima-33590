class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :password, presence: true,format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください"}
validates :nickname, presence: true
validates :birth_date, presence: true
validates :last_name, presence: true
validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
validates :first_name, presence: true
validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
validates :last_name_kana, presence: true
validates :last_name_kana,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana  characters." }
validates :first_name_kana, presence: true
validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana  characters." }
end
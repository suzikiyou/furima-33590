class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :password, presence: true,format: { with: VALID_PASSWORD_REGEX, message: "は半角6文字以上英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
validates :nickname, presence: true
validates :birth date , presence: true
validates :last name, presence: true
validates :last name,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
validates :first name, presence: true
validates :first name,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
validates :last name kana, presence: true
validates :last name kana,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana  characters." }
validates :first name kana, presence: true
validates :first name kana, { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana  characters." }
end
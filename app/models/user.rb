class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :items
   has_many :purchases

   with_options presence: true do
     validates :nickname
     validates :email
     validates :password,format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください"}
     validates :encrypted_password
     validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
     validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
     validates :last_name_kana,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana  characters." }
     validates :first_name_kana,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana  characters." }
     validates :birth_date
   end
end
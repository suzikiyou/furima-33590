require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録できる' do
        @user.valid?
        expect(@user).to be_valid
      end
    end

   context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

     it 'emailが空だと登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it 'passwordが空だと登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it 'password_confirmationが空だと登録できない' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

     it 'last_nameが空だと登録できない' do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
     end

     it 'first_nameが空だと登録できない' do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
     end

     it 'last_name_kanaが空だと登録できない' do
       @user.last_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end

     it 'first_name_kanaが空だと登録できない' do
       @user.first_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end

     it 'birth_dateが空だと登録できない' do
       @user.birth_date = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birth date can't be blank")
     end

     it '重複したemailが存在する場合登録できない' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(@user.email).to include("test@example")
     end

     it "passwordが5文字以下であれば登録できない" do
       @user.password = 'you11'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it 'passwordとpassword_confirmationが一致しないと登録できない' do
       @user.password = 'you1115'
       @user.password_confirmation = 'you1116'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     
     it 'Passwordは英語のみでは登録できない' do
       @user.password = 'youyou'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
     end

     it 'passwordが数字のみでは登録できないこと' do
       @user.password = '123456'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
     end

     it 'last_nameが数字では登録できない' do
       @user.last_name = '9'
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
     end

     it 'last_nameが英語では登録できない' do
       @user.last_name = 'you'
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
     end

     it 'first_nameが数字では登録できない' do
       @user.first_name = '10'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
     end

     it 'first_nameが英語では登録できない' do
       @user.first_name = 'suzuki'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
     end

     it 'last_name_kanaが数字では登録できない' do
       @user.last_name_kana = '9'
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana  characters.")
     end

     it 'last_name_kanaが英語では登録できない' do
       @user.last_name_kana = 'you'
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana  characters.")
     end

     it 'first_name_kanaが数字では登録できない' do
       @user.first_name_kana = '10'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana  characters.")
     end

     it 'first_name_kanaが英語では登録できない' do
       @user.first_name_kana = 'suzuki'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana  characters.")
     end
    
     it 'emailに@が無いと登録できない' do
       @user.email = 'testtset'
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
     end

     it 'passwordは全角では登録できないこと' do
       @user.password = 'YOU1115'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end 
   end
  end
end
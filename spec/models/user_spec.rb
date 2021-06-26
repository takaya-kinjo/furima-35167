require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録/ユーザー情報" do
    before do 
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまく行く時' do
      it "nickname,email,password,encrypted_passwordが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

   context '新規登録がうまく行かない時' do
     it "ニックネームが空だと登録できない" do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "メールアドレスが空だと登録できない" do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "同じメールアドレスは使用できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "メールアドレスに＠がないと登録できない" do
      @user.email = 'aaa111email'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
     it "パスワードが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "パスワードが６文字以下だと登録できない" do
      @user.password = '00000'
      @user.encrypted_password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     context "パスワードが半角英数字混合でないと登録できない" do
       it "パスワードが半角数字だけだと登録できない" do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
       end
       it "パスワードが半角英字だけだと登録できない" do
       @user.password = 'aaaaaa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
       do
       it "パスワードが全角英字だけだと登録できない" do
       @user.password = 'AAA１２３'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
       end
     end
     it "パスワードは確認用を含め２回入力しないと登録できない" do
      @user.password = '000000'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "パスワードと、確認用パスワードが一致しないと登録できない" do
      @user.password = '000abc'
      @user.password_confirmation = '111abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
    end
  end
end

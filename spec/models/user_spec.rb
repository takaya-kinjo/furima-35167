require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録/ユーザー情報" do

    it "ニックネームが空だと登録できない" do
      user = User.new(nickname: "", email: "abc@gmail.com", password: "123abc", password_confimation: "123abc")
      user.valid?

    end
    it "メールアドレスが空だと登録できない" do
    end
    it "同じメールアドレスは使用できない" do
    end
    it "メールアドレスに＠がないと登録できない" do
    end
    it "パスワードが空だと登録できない" do
    end
    it "パスワードが６文字以下だと登録できない" do
    end
    it "パスワードが半角英数字混合でないと登録できない" do
    end
    it "パスワードは確認用を含め２回入力しないと登録できない" do
    end
    it "パスワードと、確認用パスワードが一致しないと登録できない" do
    end
  end
end

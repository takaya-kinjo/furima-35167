require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do 
      @item = FactoryBot.build(:item)
    end

    context '商品出品機能"がうまく行く時' do
      it "title,comment,category,quantity,delivery_payment,delivery_prefecture,delivery_time,price,image,contentが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

   context '商品出品機能"がうまく行かない時' do

    it "商品画像がないと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

     it "タイトルが空だと登録できない" do
       @item.title = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Title can't be blank")
     end

     it "商品説明が空だと登録できない" do
      @item.comment = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Comment can't be blank")
    end

    it "カテゴリーの情報が空だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態が空だと登録できない" do
      @item.quantity_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Quantity must be other than 1")
    end

    it "配送料の負担が空だと登録できない" do
      @item.delivery_payment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery payment must be other than 1")
    end

    it "発送元の地域が空だと登録できない" do
      @item.delivery_prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery prefecture must be other than 1")
    end

    it "発送までの日数が空だと登録できない" do
      @item.delivery_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
    end

    it "販売価格が空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "販売価格が300円未満だったとき登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "販売価格が999999円以上だったとき登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end


    it "販売価格が全角だったとき登録できない" do
      @item.price = '９９９９９９'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "販売価格が半角英数混合だったとき登録できない" do
      @item.price = '123abc'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "販売価格が半角英語だったとき登録できない" do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    end
  end
end

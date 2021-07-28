require 'rails_helper'

RSpec.describe OrderShippingInfo, type: :model do
  describe '商品購入機能の実装' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping_info = FactoryBot.build(:order_shipping_info, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_info).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipping_info.building = ''
        expect(@order_shipping_info).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_shipping_info.postal_code = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_info.postal_code = '1234567'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'delivery_prefecture_idを選択していないと保存できないこと' do
        @order_shipping_info.delivery_prefecture_id = 1
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Delivery prefecture must be other than 1")
      end

      it 'cityが空だと保存できないこと' do
        @order_shipping_info.city = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_shipping_info.address = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping_info.phone_number = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_shipping_info.phone_number = '123456789101'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以以下だと保存できないこと' do
        @order_shipping_info.phone_number = '123456789'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが数字意外だと保存できないこと' do
        @order_shipping_info.phone_number = '123-567-890'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @order_shipping_info.phone_number = '１２３４５６７８９'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipping_info.user_id = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping_info.item_id = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できない' do
        @order_shipping_info.token = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

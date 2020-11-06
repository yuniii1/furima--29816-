require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '購入情報の入力' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
    end

    context '購入ができないとき' do
      it '郵便番号が空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号には-がないと登録ができない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code -を入力してください')
      end
      it '都道府県には１以外でないと登録ができない' do
        @order_address.prefectures_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '市区町村は空だと登録ができない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと登録ができない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号は空だと登録ができない' do
        @order_address.tell_phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell phone can't be blank")
      end
      it '電話番号には-があると登録ができない' do
        @order_address.tell_phone = '-'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell phone is invalid')
      end
      it '電話番号は１１桁以内でないと登録ができない' do
        @order_address.tell_phone = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell phone is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

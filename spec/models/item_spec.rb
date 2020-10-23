require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      # binding.pry
    end

  

    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it 'nameとimage、descriptionとcategory_id、condition_idとdelivery_date_id、shipping_idとshipment_source_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
        end
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品の説明は空欄だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空欄だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idが１だと登録できない' do
        @item.category_id = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'condition_idが空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'condition_idが１だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'delivery_date_id' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date is not a number")
      end
      it 'delivery_date_idが１だと登録できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date is not a number")
      end
      it 'shipping_idが空だと登録できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping is not a number")
      end
      it 'shipping_idが１だと登録できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping is not a number")
      end
      it 'shipment_source_idが空だと登録できない' do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source is not a number")
      end
      it 'shipment_source_idが１だと登録できない' do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source is not a number")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下の場合登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが10,000,000円以上の場合登録できない' do
        @item.price = '1,000,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '購入者情報の保存' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end

      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_purchase).to be_valid
      end
      it 'token(クレジットカード情報)が空だと購入ができない' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @item_purchase.post_number = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.messages).to include({:post_number => ["can't be blank", "is invalid", "is the wrong length (should be 8 characters)"]})
      end
      it '郵便番号にハイフンがないと登録できない' do
        @item_purchase.post_number = "12345678"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post number is invalid")
      end
      it '郵便番号が8桁でないと購入できない' do
        @item_purchase.post_number = "123-458"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post number is invalid", "Post number is the wrong length (should be 8 characters)")
      end
      it 'area_idが空だと購入できない' do
        @item_purchase.area_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空だと購入できない' do
        @item_purchase.municipality = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @item_purchase.house_number = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @item_purchase.phone_number = ""
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが11桁でなければ購入できない' do
        @item_purchase.phone_number = "080123456789"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number is invalid")
      end
  end
end
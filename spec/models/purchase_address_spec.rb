require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
    end

    context '購入情報の保存が問題ない場合' do
      it 'token、post_code、area、city、street、phone_numberがあれば保存ができること' do
        expect(@purchase_address).to be_valid
      end
      it 'build_nameは空でも保存で切ること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入情報の保存が問題ある場合' do
      it 'tokenが空では保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では保存できないこと' do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが半角数値でないと保存できないこと' do
        @purchase_address.post_code = '１２３-４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'areaが未選択では保存できないこと' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では保存できないこと' do
        @purchase_address.street = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンを含んでいると保存できないこと' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが10桁以上11桁以内の半角数値でないと保存できないこと' do
        @purchase_address.phone_number = '０９０-１２３４-５６７８９'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

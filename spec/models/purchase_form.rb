require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @purchase_form = FactoryBot.build(:purchase_form, item_id: @item.id, user_id: @user.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'tokenからphoneまでの６項目が全て存在すれば購入できる' do
        expect(@purchase_form).to be_valid
      end
    end

    context '商品購入できないとき' do
      it "tokenが空では購入できない" do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it "postalが空では購入できない" do
        @purchase_form.postal = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal can't be blank")
      end
      it "postalが-を含んでいないと購入できない" do
        @purchase_form.postal = "5031264"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では購入できない' do
        @purchase_form.prefecture_id = 0
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Prefecture Select')
      end
      it "minicipalitiesが空では購入できない" do
        @purchase_form.minicipalities = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Minicipalities can't be blank")
      end
      it "residenceが空では購入できない" do
        @purchase_form.residence = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Residence can't be blank")
      end
      it "phoneが空では購入できない" do
        @purchase_form.phone = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは、全角文字では購入できない' do
        @purchase_form.phone = '一あア'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは、半角英数混合では購入できない' do
        @purchase_form.phone = '0Aa'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは、半角英語では購入できない' do
        @purchase_form.phone = 'Aa'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone is invalid')
      end
      it "phoneが１２文字では購入できない" do
        @purchase_form.phone = "0" *12
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
    end
  end
end
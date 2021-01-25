require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品出品' do
    context '新規商品出品できるとき' do
      it 'imageからpriceまでの９項目が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規商品出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'state_idが空では出品できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('State Select')
      end
      it 'delivery_fee_idが空では出品できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'required_day_idが空では出品できない' do
        @item.required_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Required day Select')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは、全角文字では出品できない' do
        @item.price = '一あア０Aａ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは、半角英数混合では出品できない' do
        @item.price = '0Aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは、半角英語では出品できない' do
        @item.price = 'Aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは、299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは、10000000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end

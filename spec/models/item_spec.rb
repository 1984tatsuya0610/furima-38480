require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品の出品" do
    context '商品の出品がうまくいくとき' do
      it '全ての入力事項が、存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")      end
      it '商品名が空欄だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.postage_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage type can't be blank")
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.sender_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      it '価格が空欄だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円以下だとだと出品できない' do
        @item.price = 299 
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が10000000以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

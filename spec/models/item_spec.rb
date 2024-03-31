require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end



describe '商品出品機能' do
  context '商品出品できるとき' do
    it '記入が正しければ登録できる' do
      expect(@item).to be_valid
    end
  end

  context '新規登録できないとき' do
    it '商品名が必須であること' do
      @item.items_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Items name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態の情報が必須であること' do
      @item.situation_id  = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Situation must be other than 1")
    end
    it '配送料の負担の情報が必須であること' do
      @item.delivery_id   = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery must be other than 1")
    end
    it ' 発送元の地域の情報が必須であること' do
      @item.prefectures_id   = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
    end
    it '発送までの日数の情報が必須であること' do
      @item.day_id   = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end
    it '価格の情報が必須であること' do
      @item.price    = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price    = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price    = '99999999'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '価格は半角数値のみ保存可能であること' do
      @item.price    = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    
    
   
   
  end
end
end

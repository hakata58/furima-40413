require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  
end

describe '商品購入機能' do
  context '商品購入できるとき' do
    it '記入が正しければ登録できる' do
      expect(@buy_address).to be_valid
    end
    it '建物名は任意であること' do
      @buy_address.building_name = ''
      expect( @buy_address).to be_valid
    end
  end


  context '新規登録できないとき' do
    it '郵便番号が必須であること' do
      @buy_address.post_code = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post code is invalid")
    end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @buy_address.post_code = '１１１１１１１'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Post code is invalid")
    end
    it '都道府県が必須であること' do
      @buy_address.prefectures_id = '1'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Prefectures can't be blank")
    end
    it '市区町村が必須であること' do
      @buy_address.municipaloties = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Municipaloties can't be blank")
    end
    it '番地が必須であること' do
      @buy_address.street_address = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Street address can't be blank")
    end
    it '電話番号が必須であること' do
      @buy_address.telephone = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone can't be blank")
    end
    it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @buy_address.telephone = '11'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Telephone is too short (minimum is 10 characters)")
    end

    

    
    




  end



  
  
  
  
  
  
  
end






end

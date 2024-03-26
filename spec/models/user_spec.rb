require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end


describe 'ユーザー新規登録' do
  
  it 'nicknameが空では登録できない' do
    @user.nickname = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'emailが空では登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'メールアドレスが一意性であること' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'emailは@を含まないと登録できない' do
    @user.email = 'testmail'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end
  it 'パスワードが必須であること' do
    @user.password = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'パスワードは、6文字以上での入力が必須であること' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'パスワードは、半角英数字混合での入力が必須であること' do
    @user.password = 'aaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'お名前(全角)は名字が必須' do
    @user.surname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Surname can't be blank")
  end
  it 'お名前(全角)は名前が必須' do
    @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
  end
 
  it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.surname = 'abc'
    @user.valid?
    expect(@user.errors.full_messages).to include("Surname 全角文字を使用してください")
  end
  it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.name = 'deg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name 全角文字を使用してください")
  end
  it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
    @user.surname_katakana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Surname katakana can't be blank")
  end
  it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
    @user.name_katakana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Name katakana can't be blank")
  end
  it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
    @user.surname_katakana = 'あああ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Surname katakana 全角文字を使用してください")
  end
  it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
    @user.name_katakana = 'いいい'
    @user.valid?
    expect(@user.errors.full_messages).to include("Name katakana 全角文字を使用してください")
  end
  it '生年月日が必須であること' do
    @user.birthdate  = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthdate can't be blank")
  end
end
end

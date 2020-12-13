require 'rails_helper'

describe User do

  describe '#create' do
    # 1. nicknameとemail、password他全ての項目が存在すれば登録できること
    it 'is valid with a nickname, email, password, password_confirmation, first_name, last_name, first_kana, last_kana, birth_day' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空だと登録できないこと
    it 'is invalid without a nickname' do
      user = FactoryBot.build(:user, nickname: '')
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空だと登録できないこと
    it 'is invalid without a email' do
      user = FactoryBot.build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. emailの@がないと登録できないこと
    it 'is invalid without a email of @' do
      user = FactoryBot.build(:user, email: 'eegmail.com')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    # 5. passwordがないと登録できないこと
    it 'is invalid without a password' do
      user = FactoryBot.build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 6. passwordがあってもpassword_confirmationがないと登録できないこと
    it 'is invalid without a password_confirmation although with a password' do
      user = FactoryBot.build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 7. emailが重複した場合、登録できないこと
    it 'is invalid with a duplicate email address' do
      # user = FactoryBot.create(:user)
      # another_user = build(:user, email: user.email)
      first_user = FactoryBot.create(:user, email: 'aa@aa.co.jp')
      another_user = FactoryBot.build(:user, email: 'aa@aa.co.jp')
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    

    # 9.passwordが6字以下だと登録できないこと
    it 'is invalid with a password that has less than 6 characters ' do
      user = FactoryBot.build(:user, password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 7 characters)')
    end

    # 10.first_nameがないと登録できないこと
    it 'is invalid without a first_name' do
      user = FactoryBot.build(:user, first_name: '')
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 11.last_nameがないと登録できないこと
    it 'is invalid without a last_name' do
      user = FactoryBot.build(:user, last_name: '')
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 12.first_kanaがないと登録できないこと
    it 'is invalid without a first_kana' do
      user = FactoryBot.build(:user, first_kana: '')
      user.valid?
      expect(user.errors[:first_kana]).to include("can't be blank")
    end

    # 13.last_kanaがないと登録できないこと
    it 'is invalid without a last_kana' do
      user = FactoryBot.build(:user, last_kana: '')
      user.valid?
      expect(user.errors[:last_kana]).to include("can't be blank")
    end

    # 16.birth_dayがないと登録できないこと
    it 'is invalid without a birth_day' do
      user = FactoryBot.build(:user, birth_day: '')
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    # 17. last_kanaがカタカナでないと登録できないこと
    it 'last_kanaがカタカナで返ること' do
      user = FactoryBot.build(:user, last_kana: "a")
      user.valid?
      expect(user.errors[:last_kana]).to include("is invalid")
    end

    # 18. first_kanaがカタカナでないと登録できないこと    
    it 'first_kanaがカタカナで返ること' do
      user = FactoryBot.build(:user, first_kana: "a")
      user.valid?
      expect(user.errors[:first_kana]).to include("is invalid")
    end

    # 19. first_nameが英語では登録できない
    it 'first_nameが英語だけ入力すると登録ができない' do
      user = FactoryBot.build(:user)
      user.first_name = 'testtest'
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    # 20. last_nameが英語では登録できない
    it 'last_nameが英語だけ入力すると登録ができない' do
      user = FactoryBot.build(:user)
      user.last_name = 'testtesttest'
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end

  end
end

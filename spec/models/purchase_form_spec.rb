require 'rails_helper'

describe Address do

  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_form = FactoryBot.build(:purchase_form,item_id: @item.id ,user_id: @user.id)
    sleep(1)
  end

  describe '#create' do
    # 1. post,prefectures,city,numberが存在すれば登録できること
    it "is valid with a postal_code, prefectures, city, phone_number" do
      expect(@purchase_form).to be_valid
    end
    
    # 2. 建物の名前が空でも入力できる
    it "is valid with building_name" do
      expect(@purchase_form).to be_valid
    end


    
    # 3. postが空では登録できないこと
    it "is invalid without a post" do
      @purchase_form.postal_code = ''
      @purchase_form.valid?
      expect(@purchase_form.errors[:postal_code]).to include("can't be blank")
    end

    # 4. prefecture_idが空では登録できないこと
    it "is invalid without a prefectures" do
      @purchase_form.prefecture_id = ''
      @purchase_form.valid?
      expect(@purchase_form.errors[:prefecture_id]).to include("can't be blank")
    end

    # 5. cityが空では登録できないこと
    it "is invalid without a city" do
      @purchase_form.city = ''
      @purchase_form.valid?
      expect(@purchase_form.errors[:city]).to include("can't be blank")
    end

    # 6. house_numberが空では登録できないこと
    it "is invalid without a house_number" do
      @purchase_form.house_number = ''
      @purchase_form.valid?
      expect(@purchase_form.errors[:house_number]).to include("can't be blank")
    end

    # 7. phone_number. が空では登録できないこと
    it "is invalid without a phone_number" do
      @purchase_form.phone_number = ''
      @purchase_form.valid?
      expect(@purchase_form.errors[:phone_number]).to include("can't be blank")
    end

    # 8. tokenが空では登録できない事
    it "is invalid without a token" do
      @purchase_form.token = ''
      @purchase_form.valid?
      expect(@purchase_form.errors[:token]).to include("can't be blank")
    end

    # 9. 電話番号は英数混合では登録できない事
    it "電話番号が数字でない場合(文字列の場合)は出品できない" do
      @purchase_form.phone_number = "aaa"
      @purchase_form.valid?
      expect(@purchase_form.errors[:phone_number]).to include("is invalid")
    end

    # 10. 
    it "電話番号が数字でない場合(文字列の場合)は出品できない" do
      @purchase_form.phone_number = "111111111111"
      @purchase_form.valid?
      expect(@purchase_form.errors[:phone_number]).to include("is invalid")
    end

    it "is invalid without a post" do
      @purchase_form.postal_code = '1111111'
      @purchase_form.valid?
      expect(@purchase_form.errors[:postal_code]).to include("is invalid. Include hyphen(-)")
    end
  end



end



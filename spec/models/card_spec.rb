require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  it "priceとtokenがあれば保存ができること" do
    expect(@card).to be_valid
  end

  it "priceが空では登録できないこと" do
    @card.price = nil
    @card.valid?
    expect(@card.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空では登録できないこと" do
    @card.token = nil
    @card.valid?
    expect(@card.errors.full_messages).to include("Token can't be blank")
  end
end
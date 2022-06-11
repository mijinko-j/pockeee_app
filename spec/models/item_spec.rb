require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context 'おてつだい項目が登録できる場合' do
    it "nameとpriceがあれば保存ができること" do
      expect(@item).to be_valid
    end
  end

  context 'おてつだい項目が登録できない場合' do
    it "nameが空では保存ができないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "priceが空では保存ができないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが全角では保存ができないこと" do
      @item.price = ３００
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'ユーザーが紐付いていないとツイートは保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end

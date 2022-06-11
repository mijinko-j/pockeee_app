require 'rails_helper'

RSpec.describe Member, type: :model do
  before do
    @member = FactoryBot.build(:member)
  end

  context 'メンバー新規登録' do
    it "必須項目が存在すれば登録できる" do
      expect(@member).to be_valid
    end
  end

  context 'メンバー新規登録できないとき' do
    it 'nameが空だと登録できない' do
      @member.name = ''
      @member.valid?
      expect(@member.errors.full_messages).to include("Name can't be blank")
    end
    it 'fixedが空だと登録できない' do
      @member.fixed = ''
      @member.valid?
      expect(@member.errors.full_messages).to include("Fixed can't be blank")
    end
    it 'fixedが全角英数字だと登録できない' do
      @member.fixed = '３００'
      @member.valid?
      expect(@member.errors.full_messages).to include('Fixed is not a number')
    end
    it 'colorが空だと登録できない' do
      @member.color = nil
      @member.valid?
      expect(@member.errors.full_messages).to include("Color can't be blank")
    end
    it 'imageが空では登録できない' do
      @member.image = nil
      @member.valid?
      expect(@member.errors.full_messages).to include("Image can't be blank")
    end
    it 'ユーザーが紐付いていないとツイートは保存できない' do
      @member.user = nil
      @member.valid?
      expect(@member.errors.full_messages).to include('User must exist')
    end

  end
end

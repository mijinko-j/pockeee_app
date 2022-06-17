require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  context '投稿新規登録' do
    it "必須項目が存在すれば登録できる" do
      expect(@post).to be_valid
    end
  end

  context 'メンバー新規登録できないとき' do
    it 'dayが空だと登録できない' do
      @post.day = ''
      @post.valid?
      expect(@post.errors.full_messages).to include("Day can't be blank")
    end

    it 'itemが紐付いていないとツイートは保存できない' do
      @post.item = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('Item must exist')
    end

    it 'ユーザーが紐付いていないとツイートは保存できない' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('User must exist')
    end

    it 'memberが紐付いていないとツイートは保存できない' do
      @post.member = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('Member must exist')
    end
  end

end

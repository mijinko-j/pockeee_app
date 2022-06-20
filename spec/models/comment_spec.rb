require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  context 'comment投稿新規登録' do
    it "必須項目が存在すれば登録できる" do
      expect(@comment).to be_valid
    end
  end

  context 'comment新規登録できないとき' do
    it 'commentが空だと登録できない' do
      @comment.comment = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Comment can't be blank")
    end

    it 'comment_memberが空だと登録できない' do
      @comment.comment_member = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Comment member can't be blank")
    end

    it 'ユーザーが紐付いていないとツイートは保存できない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('User must exist')
    end

    it 'memberが紐付いていないとツイートは保存できない' do
      @comment.member = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Member must exist')
    end

    
  end
end

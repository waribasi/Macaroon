require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '必要事項が間違いなく記入されえたら登録できる' do
    end

    it 'nicknameが空では登録できない' do
    end

    it 'emailが空では登録できない' do
    end

    it '重複したメールアドレスは登録できない' do
    end

    it 'メールアドレスに@を含まない場合は登録できない' do
    end

    it 'パスワードが空だと登録できない' do
    end

    it 'パスワードが6文字未満では登録できない' do
    end

    it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
    end

    it 'Genderが選択されてないと登録できない' do
    end

    it '体重が空だと登録できない' do
    end
  
    it '体重が全角だと登録できない' do
    end

    it ''

  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '必要事項が間違いなく記入されえたら登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameを入力してください。")
    end

    it 'emailが空では登録できない' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailを入力してください。")
    end

    it '重複したメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Emailはすでに存在します。')
    end

    it 'メールアドレスに@を含まない場合は登録できない' do
      @user.email = 'monimoni'
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailは不正な値です。")
    end

    it 'パスワードが空だと登録できない' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordを入力してください。")
    end

    it 'パスワードが6文字未満では登録できない' do
      @user.password = 'acvbd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください。")
    end

    it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
      @user.password_confirmation = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません。")
    end

    it 'Genderが選択されてないと登録できない' do
      @user.gender_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Genderは1以外の値にしてください。")
    end

    it '体重が空だと登録できない' do
      @user.body_weight = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Body weightを入力してください。")
    end

    it '体重が全角数字だと登録できない' do
      @user.body_weight = '５５'
      @user.valid?
      expect(@user.errors.full_messages).to include("Body weightは数値で入力してください。")
    end

    it '体重が全角かな文字だと登録できない' do
      @user.body_weight = '五ろく'
      @user.valid?
      expect(@user.errors.full_messages).to include("Body weightは数値で入力してください。")
    end

    it '身長が空だと登録できない' do
      @user.stature = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Statureを入力してください。")
    end

    it '身長が全角数字だと登録できない' do
      @user.stature = '１５０'
      @user.valid?
      expect(@user.errors.full_messages).to include("Statureは数値で入力してください。")
    end

    it '身長が全角かな文字だと登録できない' do
      @user.stature = '1五ろく'
      @user.valid?
      expect(@user.errors.full_messages).to include("Statureは数値で入力してください。")
    end
  end
end


# 以下はメモ欄
# it ''

#   end
# binding.pry
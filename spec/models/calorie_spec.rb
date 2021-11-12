require 'rails_helper'

RSpec.describe Calorie, type: :model do
  before do
    @calorie = FactoryBot.build(:calorie)
  end

  describe 'マカロン新規投稿' do
    it '必要事項が間違いなく記入されえたら登録できる' do
      expect(@calorie).to be_valid
    end

    it 'メモが書かれてなくても保存できる' do
      @calorie.memo = ' '
      expect(@calorie).to be_valid
    end

    it '画像がなくても保存できる' do
      @calorie.image = ' '
      expect(@calorie).to be_valid
    end

    it 'ユーザーが紐付いてないと保存できない' do
      @calorie.user = nil
      @calorie.valid?
      expect(@calorie.errors.full_messages).to include("Userを入力してください")
    end

    it 'カロリーが無いと保存できない' do
      @calorie.calorie = ' '
      @calorie.valid?
      expect(@calorie.errors.full_messages).to include("Calorieを入力してください。")
    end

    it 'カロリーが10000以上だと保存できない' do
      @calorie.calorie = '10000'
      @calorie.valid?
      expect(@calorie.errors.full_messages).to include("Calorieは9999以下の値にしてください。")
    end

    it 'カロリーが全角だと保存できない' do
      @calorie.calorie = '10000'
      @calorie.valid?
      expect(@calorie.errors.full_messages).to include("Calorieは9999以下の値にしてください。")
    end

    it '食べ物が無いと保存できない' do
      @calorie.food = ' '
      @calorie.valid?
      expect(@calorie.errors.full_messages).to include("Foodを入力してください。")
    end

    it '食べ物が半角だと保存できない' do
      @calorie.food = 'meronpan'
      @calorie.valid?
      expect(@calorie.errors.full_messages).to include("Foodは不正な値です。")
    end

    it '食べ物が51文字以上だと保存できない' do
      @calorie.food = 'ファミリーマートで購入した税込み価格128円のメロンパンに塩おにぎりを添えて 〜睡魔と共にごゆっくりどうぞ...〜'
      @calorie.valid?
      expect(@calorie.errors.full_messages).to include("Foodは50文字以内で入力してください。")
    end



  end

end

# it '' do
      
# end
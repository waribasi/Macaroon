FactoryBot.define do
  factory :calorie do
    calorie {500}
    food {'メロンパン'}
    memo {'メロンパンはもう飽きたー！'}
    image {Faker::Lorem.sentence}
    association :user

  end
end

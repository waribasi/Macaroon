FactoryBot.define do
  factory :user do
    nickname              {'moni'}
    email                 {'moni@moni'}
    password              {'moni2525'}
    password_confirmation {password}
    gender_id             {3}
    body_weight           {48}
    stature               {157}
  end
end